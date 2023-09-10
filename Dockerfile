FROM golang:1.21 AS build-stage

WORKDIR /usr/src/app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./
RUN CGO_ENABLED=0 go build -o /usr/local/bin/app

FROM alpine:latest

COPY --from=build-stage /usr/local/bin/app /app

EXPOSE 8080

ENTRYPOINT ["/app"]
