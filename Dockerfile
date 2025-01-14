# Build stage
FROM golang:latest as builder

WORKDIR /build
COPY . .
#RUN go install github.com/bitvora/haven@latest
# Build from source
RUN go build -o haven .

# Runtime stage
FROM debian:bookworm-slim

WORKDIR /app

COPY --from=builder /build/haven /app/

RUN chmod +x /app/haven

CMD ["/app/haven"]