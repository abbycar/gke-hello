FROM golang:1.14

RUN go get -u -v github.com/go-delve/delve/cmd/dlv

WORKDIR /src/hello-world

COPY . ./

RUN go build -o /app -v ./

ENTRYPOINT ["dlv", "exec", "/app", "--continue", "--accept-multiclient", "--api-version=2", "--headless", "--listen=:3000", "--log"]