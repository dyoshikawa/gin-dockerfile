FROM golang:1.10.2-alpine
MAINTAINER dyoshikawa

RUN apk add -U --no-cache git

RUN mkdir /go/src/myproject
WORKDIR /go/src/myproject
COPY example.go .

RUN go get -u github.com/golang/dep/cmd/dep
RUN dep init
RUN dep ensure

CMD go run example.go
