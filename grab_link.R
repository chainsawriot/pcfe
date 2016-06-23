#!/usr/bin/env Rscript

suppressMessages(library(rvest))
library(methods)

args <- commandArgs(trailingOnly = TRUE)
input_url <- args[1]

links <- read_html(input_url) %>% html_nodes("li") %>% html_node("a") %>% html_attr("href")

for (url in links) {
    cat(paste0(url, "\n"))
}
