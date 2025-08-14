FROM golang:1.24 AS builder

WORKDIR /usr/src/frontend

COPY . /usr/src/frontend/

RUN go build

FROM golang:1.24

COPY --from=builder /usr/src/frontend/frontend .

ENV BACKEND_PORT=9000 BACKEND_DNS=127.0.0.1

EXPOSE 8080

CMD [ "./frontend" ]