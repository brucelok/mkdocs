# mkdocs
The project demonstrates a simple way to containerize a web application called MkDocs (https://www.mkdocs.org)

## author
lok.bruce@gmail.com

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
├── mkdocs.yml
└── .gitlab-ci.yml
```

## Build the MkDocs app with Docker

run the shell script `mkdockerize.sh` locally, the script will:
1. Build image of Mkdocs from Dockerfile.
2. Run Mkdocs as a container with port 8000 expose.

Then you should be able to access `http://127.0.0.1:8000` from your local web browser.
you can also view the status of running container with `docker ps`
```
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                     PORTS                    NAMES
6ea5c6e3d9d2        py-mkdocs:latest    "mkdocs serve"      5 hours ago         Up 5 hours                 0.0.0.0:8000->8000/tcp   crazy_lovelace
```

## Update Mkdocs config
### 1. live changes
Since Mkdocs is running as a container, one can attach to the container by:
```
$ docker exec -it <container_id> /bin/bash
```
then you may change any config in `mkdocs.yml` and `docs/`. The Mkdocs process will automatically pick up the changes you made.

### 2. Change from source codes
One can also change the `mkdocs.yml` and `docs/` where you clone the project, then re-run `mkdockerize.sh`.  However the existing pod will be killed, and started new one with new config.

## CI jobs
The CI contains two stages `Build` and `Test`:
### 1. Build
It simply runs `docker build` command to test building image from Dockerfile.

### 2. Test
It will test the full cycle of building image, running and testing the container by execute shell script `mkdockerize.sh`:
1. Builds docker image from dockerfile
2. Creates a container named `my-mkdocs` over the the image
3. Attachs to the container and run `http_test.py` to test if Mkdocs is up and running
