#!/bin/sh
printf "\nBuild Docker image\n"
docker build -t py-mkdocs .
printf "\run Docker containe"
docker run -d -p 8000:8000 py-mkdocs:latest
printf "\wait for service up"
sleep 5
printf "\nopen web browser with URL http://127.0.0.1:8000"
printf "\nrun script to test URL\n"
python http_test.py
