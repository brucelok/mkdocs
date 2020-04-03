FROM python:2.7-slim
MAINTAINER lok.bruce@gmail.com

WORkDIR /app
COPY . /app

RUN pip install mkdocs
EXPOSE 8000
CMD ["mkdocs", "serve"]
