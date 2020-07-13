FROM golang:alpine as builder
ARG TARGETARCH
ARG TARGETOS

ARG DNSCRYPT_PROXY_VERSION=2.0.44

ENV CGO_ENABLED=0 \
    GOOS=${TARGETOS} \
    GOARCH=${TARGETARCH}

RUN apk add --update --no-cache \
        build-base \
        gcc \
        git \
 && git clone https://github.com/DNSCrypt/dnscrypt-proxy.git \
              /go/src/github.com/DNSCrypt/dnscrypt-proxy/src \
 && cd /go/src/github.com/DNSCrypt/dnscrypt-proxy/src/dnscrypt-proxy \
 && git checkout ${DNSCRYPT_PROXY_VERSION} \
 && go build -ldflags="-s -w" -mod vendor


FROM alpine:latest

COPY --from=builder /go/src/github.com/DNSCrypt/dnscrypt-proxy/src/dnscrypt-proxy/dnscrypt-proxy \
                    /usr/local/bin/dnscrypt-proxy

RUN dnscrypt-proxy --version \
 && apk add --update --no-cache \
        bind-tools \
        ca-certificates \
 && rm -rf /tmp/* /var/cache/apk/*

EXPOSE 8053/tcp
EXPOSE 8053/udp

COPY dnscrypt-proxy.toml /etc/dnscrypt-proxy.toml

ENTRYPOINT [ "/usr/local/bin/dnscrypt-proxy" \
           , "-config" , "/etc/dnscrypt-proxy.toml" ]

HEALTHCHECK --interval=10s --timeout=5s --start-period=20s \
        CMD dig +short @127.0.0.1 -p 8053 google.com A || exit 1
