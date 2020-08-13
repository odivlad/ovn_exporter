FROM centos:centos7.8.2003

LABEL maintainer="Vladislav Odintsov <odivlad@gmail.com>"

RUN yum install epel-release make git -y && yum install golang -y

RUN git clone https://github.com/odivlad/ovn_exporter /code

WORKDIR /code

ENV GOPATH=/code/path

ENV GOBIN=$GOPATH/bin

RUN go get ./...

RUN make
