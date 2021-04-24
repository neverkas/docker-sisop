#FROM ubuntu:xenial
FROM ubuntu:bionic

MAINTAINER jelou

RUN apt-get update && apt-get install -y \
    aptitude git \
    gcc gdb libcunit1 g++ libcunit1-dev \
    valgrind htop \
    emacs vim nano \
    strace ssh make curl wget \
    libncurses5 tig autotools-dev libevent1-dev libfuse-dev libreadline6-dev \
    build-essential
# libreadline6 
COPY . /usr/src/so-commons-library
WORKDIR /usr/src/so-commons-library
RUN make clean && make
WORKDIR /usr/src/so-commons-library
RUN make clean all test

EXPOSE 22
