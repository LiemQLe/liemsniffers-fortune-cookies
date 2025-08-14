FROM golang:1.24 AS builder

WORKDIR /usr/src/frontend

COPY . /usr/src/frontend/

RUN go build

FROM golang:1.24

COPY --from=builder /usr/src/frontend/frontend .

EXPOSE 8080

RUN go run frontend