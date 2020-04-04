#!/bin/sh
printf "\nBuild image from Dockerfile\n"
docker build -t py-mkdocs .
printf "Run Docker container\n"
docker run -d -p 8000:8000 py-mkdocs:latest
printf "Wait for service up and running\n"
sleep 5

if which python > /dev/null; then
  python http_test.py
else
  echo "No python installed, skip test\n"
fi

printf "\nopen web browser with URL http://127.0.0.1:8000\n"
