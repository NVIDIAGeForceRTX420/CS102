library(ggplot2)
library(dplyr)
library(polite)
library(xml2)
library(magrittr)
library(rvest)
library(httr)

polite::use_manners(save_as = "polite_scrape.R")

URL_P1 <- 'https://www.amazon.com/s?i=specialty-aps&bbn=16225007011&rh=n%3A16225007011%2Cn%3A172635&ref=nav_em__nav_desktop_sa_intl_printers_0_2_6_11'
URL_P2 <- 'https://www.amazon.com/s?i=specialty-aps&bbn=16225009011&rh=n%3A%2116225009011%2Cn%3A172541&ref=nav_em__nav_desktop_sa_intl_headphones_0_2_5_8'
URL_P3 <- 'https://www.amazon.com/s?k=external+hard+drive&i=todays-deals&crid=1X4CF2W4CEQ5G&sprefix=external+hard%2Caps%2C188&ref=nb_sb_ss_ts-doa-p_1_14'

# P1
session1 <- bow(URL_P1, user_agent = "Educational")

product_data1 <- scrape(session1) %>% html_nodes('div.s-result-item')

ProductDesc1 <- product_data1 %>%
  html_nodes('span.a-size-medium.a-color-base.a-text-normal') %>%
  html_text() %>%
  trimws()

PriceAMT1 <- product_data1 %>%
  html_nodes('span.a-offscreen') %>%
  html_text() %>%
  trimws()

StarsRT1 <- product_data1 %>%
  html_nodes('span.a-icon-alt') %>%
  html_text() %>%
  trimws()

QuantityRT1 <- product_data1 %>%
  html_nodes('span.a-size-base.s-underline-text') %>%
  html_text() %>%
  trimws()

# P2
session2 <- bow(URL_P2, user_agent = "Educational")

product_data2 <- scrape(session2) %>% html_nodes('div.s-result-item')

ProductDesc2 <- product_data2 %>%
  html_nodes('span.a-size-medium.a-color-base.a-text-normal') %>%
  html_text() %>%
  trimws()

PriceAMT2 <- product_data2 %>%
  html_nodes('span.a-offscreen') %>%
  html_text() %>%
  trimws()

StarsRT2 <- product_data2 %>%
  html_nodes('span.a-icon-alt') %>%
  html_text() %>%
  trimws()

QuantityRT2 <- product_data2 %>%
  html_nodes('span.a-size-base.s-underline-text') %>%
  html_text() %>%
  trimws()

# P3
session3 <- bow(URL_P3, user_agent = "Educational")

product_data3 <- scrape(session3) %>% html_nodes('div.s-result-item')

ProductDesc3 <- product_data3 %>%
  html_nodes('span.a-size-medium.a-color-base.a-text-normal') %>%
  html_text() %>%
  trimws()

PriceAMT3 <- product_data3 %>%
  html_nodes('span.a-offscreen') %>%
  html_text() %>%
  trimws()

StarsRT3 <- product_data3 %>%
  html_nodes('span.a-icon-alt') %>%
  html_text() %>%
  trimws()

QuantityRT3 <- product_data3 %>%
  html_nodes('span.a-size-base.s-underline-text') %>%
  html_text() %>%
  trimws()

allProductDesc <- c(ProductDesc1, ProductDesc2, ProductDesc3)
allPriceAMT <- c(PriceAMT1, PriceAMT2, PriceAMT3)
allStarsRT <- c(StarsRT1, StarsRT2, StarsRT3)
allQuantityRT <- c(QuantityRT1, QuantityRT2, QuantityRT3)

df <- data.frame(allProductDesc, allPriceAMT, allStarsRT, allQuantityRT)
View(df)