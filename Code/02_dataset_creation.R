#Read libraries
library(tidyverse)
library(pdftools)
library(tidytext)

file <- list.files(path = "Documents/")

data <- c()

for(i in 1:length(file)){
  data <- c(data, pdf_text(str_c("documents/",file[i])))
}

data <- data %>% 
  str_replace_all(., "\n", " ")

data_df <- tibble(text = data)

data_df <- data_df %>% 
  unnest_tokens(word,text)

data(stop_words)

data_df<- data_df %>% 
  anti_join(stop_words)
