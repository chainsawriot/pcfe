#!/usr/bin/env Rscript
suppressMessages(library(rvest))
library(methods)
args <- commandArgs(trailingOnly = TRUE)
cat(args)
input_url <- args[1]
cat(input_url)
