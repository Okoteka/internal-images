FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    sshpass \
    openssh-client \
    git \
    curl \
    make \
    && pip install --no-cache-dir \
    ansible \
    docker \
    && rm -rf /var/lib/apt/lists/*

# Install just runner
RUN curl -fsSL https://just.systems/install.sh | bash -s -- --to /usr/local/bin

WORKDIR /app

CMD ["ansible-playbook", "--version"]
