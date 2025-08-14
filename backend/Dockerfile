FROM golang:1.24 AS builder

WORKDIR /usr/src/backend

COPY . /usr/src/backend/

RUN go build

FROM golang:1.24

COPY --from=builder /usr/src/backend/backend .

ENV REDIS_DNS=redis

EXPOSE 9000

CMD [ "./backend" ]