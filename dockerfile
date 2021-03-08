FROM python:2.7-slim
MAINTAINER lok.bruce@gmail.com

# copy MkDocs initial config files
WORkDIR /app
COPY . /app

# install MkDocs
RUN pip install mkdocs
EXPOSE 8000
CMD ["mkdocs", "serve"]
