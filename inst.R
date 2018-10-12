install.packages(c("httr", "jsonlite", "lubridate"))

library (httr)
library (jsonlite)


file.remove('.httr-oauth') # Remove current token

app_name <- "testM"
client_id <- "7e08e42ee59f48bb8dd3a80d7b751c8b"
client_secret <- "7c20a6a8e42a45069e41dffba82dc0e5"
scope = "public_content"


code="8f48b5b9865a41168c35fdbaab6ed1f5"



instagram <- oauth_endpoint("requestToken", "authorize/?client_id=CLIENT-ID&redirect_uri=http://localhost:1410/?&response_type=code", "access_token",
                           base_url = "https://api.instagram.com/oauth")

myapp <- oauth_app(app_name, client_id, client_secret)



inst_token<-oauth2.0_token(
  endpoint=instagram,
  app=myapp,
#  type = "application/x-www-form-urlencoded",
  user_params = list(grant_type = "authorization_code",
  redirect_uri = "http://localhost:1410/?",
  code="8f48b5b9865a41168c35fdbaab6ed1f5"
  )
)

token<-inst_token[["credentials"]][["access_token"]]
user<-inst_token[["credentials"]][["user"]]

#user info
fromJSON(paste("https://api.instagram.com/v1/users/self/?access_token=",token, sep=""))

#recent media
r<-fromJSON(paste("https://api.instagram.com/v1/users/self/?access_token=",token, sep=""))
r$data$images
  
#comments

r <- fromJSON(paste('https://api.instagram.com/v1/users/self/media/recent/?access_token=',token,sep=""))
received_profile <- r$data$id

#the application will collect hashtags from the list that relate to toursts areas of Paris
# 
media <- fromJSON((paste('https://api.instagram.com/v1/users/self/media/recent/?access_token=',token,sep="")))