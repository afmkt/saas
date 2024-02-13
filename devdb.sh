#!/bin/sh
# podman pull mysql:latest
rm -rf datadir
mkdir datadir
podman \
    run \
    --replace \
    --userns keep-id:uid=501,gid=20 \
    -d \
    --security-opt label=disable \
    --name mysql \
    -p 3306:3306 \
    -v ./datadir:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD='test' \
    -e MYSQL_USER=admin \
    -e MYSQL_PASSWORD='test' \
    -e MYSQL_DATABASE=plura \
    mysql:latest

# podman -c podman-machine-default \
#     run \
#     --replace \
#     --rm \
#     --userns keep-id:uid=999,gid=999 \
#     -d \
#     -e MYSQL_ROOT_PASSWORD=foobar \
#     --security-opt label=disable \
#     --name mysql \
#     -v ./datadir:/var/lib/mysql \
#     docker.io/library/mysql 