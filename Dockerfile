FROM golang:1.10.2-alpine
MAINTAINER dyoshikawa

RUN apk add -U --no-cache git

RUN mkdir /go/src/myproject
WORKDIR /go/src/myproject
COPY example.go .

RUN go get github.com/gin-gonic/gin
RUN dep init
RUN dep ensure

CMD go run example.go
