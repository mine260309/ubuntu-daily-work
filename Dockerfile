# use the ubuntu 14.04 base image
FROM ubuntu:14.04

MAINTAINER Lei YU mine260309@gmail.com

# update package repository
RUN apt-get update

# install g++, git, zlib
RUN apt-get install -y build-essential g++ zlib1g-dev libbz2-dev
RUN apt-get install -y git vim tmux
