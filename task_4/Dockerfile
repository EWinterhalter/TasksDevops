FROM golang:alpine

WORKDIR /app

COPY app/main.go ./

RUN go build -o main .

CMD ["./main"]
