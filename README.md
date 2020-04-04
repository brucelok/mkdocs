# mkdocs

The project demonstrates a simple way to containerize a web application called MkDocs (https://www.mkdocs.org)

## Prerequisites
* Python >= 2.7
* Docker = 19.03.0

## Clone the project to local
```
$ git clone https://gitlab.com/lok.bruce/mkdocs.git
```

## Build the MkDocs app with Docker

run the shell script mkdockerize.sh, the script run docker commands to:
1. build image of Mkdocs from scratch.
2. Run Mkdocs as a container with port 8000 expose.
3. Run self test http://127.0.0.1:8000 .
Then you should be able to access http://127.0.0.1:8000 from your local web browser.

## File structure
Here are the file structure, mkdocs.yml and directory docs/ are where you can customize your Mkdocs.
The rest of files are mainly for build file and test script
```
.
├── README.md
├── dockerfile
├── docs
│   ├── about.md
│   └── index.md
├── http_test.py
├── mkdockerize.sh
└── mkdocs.yml
```

## Update Mkdocs config
### 1. live changes
Since Mkdocs is running as a container, one can attach to the container by:
```
$ docker exec -it <container_id> /bin/bash
```
then change any config you want in mkdocs.yml and docs/
The Mkdocs will automatically pick up the changes

###2. change in source
Once can also change the mkdocs.yml and docs/ at host level,
then re-run `mkdockerize.sh`.  However the existing pod will be killed, and started new one with new config.
