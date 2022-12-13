#Read libraries
library(tidyverse)
library(tidytext)

load("data.Rdata")


#data <- data %>% 
#  unnest_tokens(word,text)

#Remove some words
#data("stop_words")
remove <- c("icots11", )