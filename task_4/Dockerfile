FROM golang:alpine

WORKDIR /app

COPY app/main.go ./

RUN go mod init temp && go mod tidy

RUN go build -o main .

CMD ["./main"]
