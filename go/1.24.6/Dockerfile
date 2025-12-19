FROM golang:1.24.6-alpine

COPY internal.crt /usr/local/share/ca-certificates/

RUN update-ca-certificates

RUN apk add --no-cache git openssh

ENV GOPRIVATE=g.nas.loc

RUN mkdir -p /root/.ssh && \
    ssh-keyscan g.nas.loc >> /root/.ssh/known_hosts

RUN --mount=type=ssh \
    git config --global url."ssh://git@g.nas.loc/".insteadOf "https://g.nas.loc/"

CMD ["go", "version"]
