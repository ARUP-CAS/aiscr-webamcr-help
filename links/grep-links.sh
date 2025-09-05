#!/usr/bin/env bash

# Extract all markdown‑style links from *.qmd files and write them to links/links.txt
find . -type f -name '*.qmd' -print0 |
  xargs -0 grep -Pho '\[[^]]+\]\([^)]*\)(\{\.external\})*' > links/links.txt
