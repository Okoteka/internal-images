FROM python:3.11-slim

# Install Docker CLI
RUN apt-get update && apt-get install -y --no-install-recommends \
    sshpass \
    openssh-client \
    git \
    curl \
    make \
    ca-certificates \
    gnupg \
    lsb-release \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bullseye stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends docker-ce-cli \
    && pip install --no-cache-dir \
    ansible \
    docker \
    && rm -rf /var/lib/apt/lists/*

# Install task runner
RUN curl -sSL https://taskfile.dev/install.sh | sh -s -- -b /usr/local/bin

WORKDIR /app

CMD ["ansible-playbook", "--version"]
