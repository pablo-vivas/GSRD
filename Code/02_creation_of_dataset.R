#Read libraries
library(tidyverse)
library(pdftools)
library(tidytext)

file <- list.files(path = "Documents/")

data <- c()

for(i in 1:length(file)){
  data <- c(data, pdf_text(str_c("Documents/",file[i])))
}

data <- tibble(text = data)

save(data, file = "data.RData")
