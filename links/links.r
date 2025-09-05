library(tidyverse)

# written by Lumo
#' Safely test a vector of URLs with httr2
#'
#' This version guards against the “argument is of length zero” error that can
#' arise when the error text has no 3‑digit status code.
#'
#' @inheritParams check_urls
#' @return Same structure as the original `check_urls()` function.
#' @export
check_urls <- function(urls,
                       timeout_sec = 10) {
  if (!requireNamespace("httr2", quietly = TRUE)) {
    stop("Package 'httr2' is required but not installed. Run install.packages('httr2').")
  }
  
  probe_one <- function(u) {
    req <- httr2::request(u) |> httr2::req_timeout(timeout_sec)
    
    result <- tryCatch(
      {
        resp <- httr2::req_perform(req)
        code <- httr2::resp_status(resp)
        
        list(
          ok = identical(code, 200L),
          status_code = code,
          error_msg = NULL
        )
      },
      error = function(e) {
        msg <- conditionMessage(e)
        
        ## ----- Robust extraction of a possible 3‑digit status code -----
        ## Look for the first occurrence of exactly three digits.
        ## `regexpr` returns -1 when there is no match, so we test that.
        start_pos <- regexpr("\\b\\d{3}\\b", msg)
        if (start_pos[1] != -1) {
          code_str <- substr(msg, start_pos, start_pos + attr(start_pos, "match.length") - 1)
          code_num <- as.integer(code_str)
        } else {
          code_num <- NA_integer_
        }
        ## --------------------------------------------------------------
        
        list(
          ok = FALSE,
          status_code = code_num,
          error_msg = msg
        )
      }
    )
    
    data.frame(
      url = u,
      ok = result$ok,
      status_code = result$status_code,
      error_msg = I(list(result$error_msg)),
      stringsAsFactors = FALSE
    )
  }
  
  do.call(rbind, lapply(urls, probe_one))
}


# read and process lines
links <- read_lines(here::here("links/links_2025-08-27.txt")) %>% 
  as_tibble() %>% 
  mutate(file = str_extract(value, "[^\\:]+(?=\\:)"),
         line = as.integer(str_extract(value, "(?<=\\:)[^\\:]+(?=\\:)")),
         text = str_extract(value, "(?<=\\[).+(?=\\])"),
         url = str_extract(value, "(?<=\\]\\()[^\\[\\]]+(?=\\))"),
         qmd = str_detect(value, "\\(.+\\.qmd\\)"),
         anchor = str_detect(value, "\\(.+\\.qmd#.+\\)"),
         fig = str_detect(value, "figs"),
         mailto = str_detect(value, "mailto"),
         external = str_detect(value, "\\{\\.external\\}"),
         http = str_detect(value, "http"))


# basics ------------------------------------------------------------------

# figs
links %>% 
  filter(fig) %>% 
  View()
# ok

# internal links (to qmds)
links %>% 
  filter(qmd) %>% 
  View()
# ok

links %>% 
  filter(anchor) %>% 
  View()
# ok

# mailtos
links %>% 
  filter(mailto) %>% 
  View()
# ok


# outside links -----------------------------------------------------------

links %>% 
  filter(external) %>% 
  View()

links %>% 
  filter(http) %>% 
  View()

# check that outside urls return HTTP status 200
# extract only unique urls
urls <- c(filter(links, external)$url, filter(links, http)$url) %>% 
  unique()

# status <- check_urls(urls)

status %>% 
  View()


# other issues ------------------------------------------------------------

links %>% 
  filter(!mailto, !fig, !qmd, !anchor, !external, !http) %>% 
  View()
# ok

links %>% 
  filter(str_detect(url, "uploads")) %>% 
  View()

