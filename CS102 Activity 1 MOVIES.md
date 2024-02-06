---
title: "CS102 Activity 1"
author: "Anton"
date: "2024-02-06"
output: pdf_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
```{r Library}
library(dplyr)
library(polite)
library(xml2)
library(magrittr)
library(rvest)
library(httr)
library(kableExtra)
```
```{r URL}
polite::use_manners(save_as = "polite_scrape.R")
URLMovie <- 'https://www.imdb.com/title/tt1853728/reviews/?ref_=tt_ql_2'
session <- rvest::html_session(URLMovie)
```
```{r CHR}
USER <- character(0)
REVIEWDATE <- character(0)
CONTENT <- character(0)
METASCORE <- character(0)
```
```{r SCRAPE}
USERdata <- session %>%
  rvest::html_nodes('span[class="display-name-link"]') %>%
  rvest::html_text()

DATEdata <- session %>%
  rvest::html_nodes('div[class="display-name-date"]') %>%
  rvest::html_text()

CONTENTdata <- session %>%
  rvest::html_nodes('div[class="review-container"]') %>%
  rvest::html_text()

METAdata <- session %>%
  rvest::html_nodes('span[class^="sc-"]') %>%
  rvest::html_text()
```
```{r DF}
movie_reviews <- tibble(
  USER = USERdata,
  REVIEWDATE = DATEdata,
  CONTENT = CONTENTdata,
  METASCORE = METAdata
)

print(movie_reviews)
```