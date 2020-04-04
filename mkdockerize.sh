#!/bin/sh
printf "\nBuild Docker image\n"
docker build -t py-mkdocs .
printf "\run Docker containe"
docker run -d -p 8000:8000 py-mkdocs:latest
printf "\wait for service up and running"
sleep 5

if which python > /dev/null; then
  python http_test.py
else
  echo "No python installed, skip test"
fi

printf "\nopen web browser with URL http://127.0.0.1:8000\n"
