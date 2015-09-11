# use the ubuntu 14.04 base image
FROM ubuntu:14.04

MAINTAINER Lei YU mine260309@gmail.com

# Replace sources.list with mirrow ubuntu.cs.nctu.edu.tw
# which is much faster than official server for asia users
COPY apt-source-asia.list /etc/apt/sources.list

# Update package repository
RUN apt-get update

# Install g++, git, zlib, etc
RUN apt-get install -y build-essential g++ zlib1g-dev libbz2-dev
RUN apt-get install -y git vim tmux
RUN apt-get install -y aptitude bash-completion dos2unix ftp gcc-multilib \
                       gdb ghex gitk libboost-all-dev libc6-dbg meld python \
                       quilt wget zip

# Add user `mine`, change to your favorite name
RUN useradd -ms /bin/bash mine && echo "mine:mine" | chpasswd && adduser mine sudo
RUN mkdir -p /home/mine && chown -R mine:mine /home/mine
USER mine
WORKDIR /home/mine
CMD /bin/bash
