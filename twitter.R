install.packages ("rtweet")

library(rtweet)

# plotting and pipes - tidyverse!
library(ggplot2)
library(dplyr)
# text mining library
library(tidytext)
# plotting packages
library(igraph)
library(ggraph)

# whatever name you assigned to your created app
appname <- "MariaP"

## api key (example below is not a real key)
key <- "W6G8J2SOcOpoLnidoCeM4XIIH"

## api secret (example below is not a real key)
secret <- "MHdYH2ui7cQlsXoDVk65H6gnWyqolDuyaukfJIm4Vh8Su9rnoS"

# create token named "twitter_token"
twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret)

test<-get_timeline("Crowdcube", n=1000)

#retrieve user data
CC<-users_data(test) 
CC<-unique(CC)

table(test$screen_name)