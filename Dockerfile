FROM golang:1.14

# For debugging
# RUN go get -u -v github.com/go-delve/delve/cmd/dlv

WORKDIR /src/hello-world

COPY . ./

RUN go build -o /app -v ./

ENTRYPOINT [ "/app" ]

# Replace ENTRYPOINT [ "/app" ] with this line for debugging
# ENTRYPOINT ["dlv", "exec", "/app", "--continue", "--accept-multiclient", "--api-version=2", "--headless", "--listen=:3000", "--log"]