# mkdocs

The project demonstrates a simple way to containerize a web application called MkDocs (https://www.mkdocs.org)

## Prerequisites
* Python >= 2.7
* Docker = 19.03.0

## Clone the project to local
```
$ git clone https://gitlab.com/lok.bruce/mkdocs.git
```

## File structure
Here are the file structure, `mkdocs.yml` and directory `docs/` are where you can customize your Mkdocs.
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

## Build the MkDocs app with Docker

run the shell script `mkdockerize.sh`, the script will run docker commands to:
1. build image of Mkdocs from Dockerfile.
2. Run Mkdocs as a container with port 8000 expose.
3. Run `http_test.py` for self test.
Then you should be able to access `http://127.0.0.1:8000` from your local web browser.

## Update Mkdocs config
### 1. live changes
Since Mkdocs is running as a container, one can attach to the container by:
```
$ docker exec -it <container_id> /bin/bash
```
then change any config you want in `mkdocs.yml` and `docs/`. The Mkdocs process will automatically pick up the changes you made.

### 2. Change from source codes
One can also change the `mkdocs.yml` and `docs/` where you clone the project, then re-run `mkdockerize.sh`.  However the existing pod will be killed, and started new one with new config.
