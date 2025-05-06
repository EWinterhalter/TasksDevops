FROM golang:alpine

WORKDIR /app

RUN go mod tidy

COPY main.go .

RUN go build -o main .

CMD ["./main"]
