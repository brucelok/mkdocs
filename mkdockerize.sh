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
  </dev/tcp/127.0.0.1/8000
  if [ "$?" -ne 0 ]; then
    echo "127.0.0.1:8000 failed"
    exit 1
  else
    echo "127.0.0.1:8000 succeeded"
    exit 0
  fi
fi

printf "\nopen web browser with URL http://127.0.0.1:8000\n"
