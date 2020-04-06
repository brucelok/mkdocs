#!/bin/sh
printf "\nBuild image from Dockerfile\n"
docker build -t py-mkdocs .
printf "Run Docker container\n"
docker run --name my-mkdocs -d -p 8000:8000 py-mkdocs:latest
printf "Wait for service up and running\n"
printf "\nopen web browser with URL http://127.0.0.1:8000\n"
