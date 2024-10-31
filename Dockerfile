# Build stage
FROM golang:latest as builder

WORKDIR /build

#RUN go install github.com/bitvora/haven@latest
RUN go build -o haven .

# Runtime stage
FROM debian:bookworm-slim

WORKDIR /app

COPY --from=builder /go/bin/haven /app/haven

RUN chmod +x /app/haven

CMD ["/app/haven"]
