# Bind9 Docker Image

## Description

This docker image provides a [bind service](https://www.isc.org/downloads/bind/) based on [Alpine Linux](https://hub.docker.com/_/alpine/).

## Usage

If you like to use this image, please use a specific version tag like `latest`. The other branches are only temporary and will be deleted after the merge into the other branches.

There are two options to start your Bind container.

### Docker Run
Use this docker command to run the bind container.
```
docker run -d --name bind -p 53:53 -p 53:53/udp \
-v /bindconfig:/etc/bind -v /bindlog:/var/log/named \
--restart=always vukomir/bind:latest
```

### Docker Compose
Check out the docker-compose file in the [git repo](https://raw.githubusercontent.com/vukomir/bind/master/docker-compose.yml).
```
docker-compse up -d
```

## Bind Stuff

### Bind Configuration
To pass your configuration directory with all configs and files, you've to mount the volume into the docker container with the docker option:
```
-v <bindconfig>:/etc/bind
```
## Bind Logfiles
To log the bind logs on your docker host, just mount a directory into the docker container:
```
-v <logdir>:/var/log/named
```
