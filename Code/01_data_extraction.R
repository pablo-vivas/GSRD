#Get wd
wd <- getwd()

#Load Libraries
library(tidyverse)
library(rvest)
library(stringr)

#Set wd
setwd(str_c(getwd(),"/Documents"))

page <- read_html("https://iase-web.org/Conference_Proceedings.php?p=ICOTS_11_2022")

pdfs <- page %>%
  html_nodes("a") %>% 
  html_attr("href") %>% 
  str_subset("\\.pdf") %>% 
  str_subset("ICOTS11_") %>%
  str_subset("icots/11/") %>%
  str_c("https://iase-web.org/", .) %>% 
  str_replace("\\.pdf.*","") %>% 
  str_c(., ".pdf") %>% 
  walk2(., basename(.), download.file, mode = "wb")

setwd(wd)
