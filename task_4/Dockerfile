FROM golang:-alpine

WORKDIR /app

COPY go.mod ./

RUN go mod tidy

COPY . .

RUN go build -o main .

CMD ["./main"]
