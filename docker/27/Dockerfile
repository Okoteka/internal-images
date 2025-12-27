FROM docker:27

# ---- CA ----
COPY internal.crt /usr/local/share/ca-certificates/internal.crt
RUN update-ca-certificates

# ---- Utils ----
RUN apk add --no-cache \
    bash \
    git \
    openssh \
    curl \
    ca-certificates

# ---- SSH  ----
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh

# ---- Docker registry CA ----
RUN mkdir -p /etc/docker/certs.d/g.nas.loc:4567 \
 && cp /usr/local/share/ca-certificates/internal.crt \
    /etc/docker/certs.d/g.nas.loc:4567/ca.crt

# ---- Env ----
ENV DOCKER_HOST=tcp://docker:2375 \
    DOCKER_TLS_CERTDIR=""

CMD ["docker", "version"]
