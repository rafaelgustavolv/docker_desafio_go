# start a golang base image, version 1.8
FROM golang:1.8

#install upx
#RUN apt-get update -y && apt-get install -y upx-ucl=3.94-4

#switch to our app directory
RUN mkdir -p /go/src/helloworld
WORKDIR /go/src/helloworld

#copy the source files
COPY helloworld.go /go/src/helloworld

#disable crosscompiling 
ENV CGO_ENABLED=0

#compile linux only
ENV GOOS=linux

#build the binary with debug information removed
RUN go build  -ldflags '-w -s' -a -installsuffix cgo -o helloworld

#compress using upx
#RUN upx -1 -o helloworld_compress helloworld
