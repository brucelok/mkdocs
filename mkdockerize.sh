#!/bin/sh

if [ ! "$(docker ps -q -f name=my-mkdocs)" ]; then
printf "check if existing container my-mkdocs is running"

  if [ "$(docker ps -aq -f status=exited -f name=my-mkdocs)" ]; then
    printf "\nclean up existing container\n"
    docker rm my-mkdocs
  fi

  printf "\nBuild image from Dockerfile\n"
  docker build -t py-mkdocs .
  
  printf "Run Docker container\n"
  docker run --name my-mkdocs -d -p 8000:8000 py-mkdocs:latest
  printf "Wait for service up and running\n"
fi
printf "\nopen web browser with URL http://127.0.0.1:8000\n"
