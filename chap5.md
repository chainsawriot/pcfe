# Chapter 3: Interfacing with other languages

> This is the Unix philosophy: Write programs that do one thing and do it well. Write programs to work together. Write programs to handle text streams, because that is a universal interface.

Designing a web scraper with the aid of R.

* http://www.info.gov.hk/gia/general/201606/20c.htm

* `apt-get install r-base`

* install.packages('rvest')

```{r}
suppressMessages(library(rvest))
library(methods)
args <- commandArgs(trailingOnly = TRUE)
input_url <- args[1]
cat(input_url)
```
