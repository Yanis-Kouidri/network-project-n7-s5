FROM ubuntu

RUN apt-get update && apt-get install -y \
    vim \
    tree \
    dnsutils  \
    iputils-ping \
    iproute2 \
    wget \
    curl \
    traceroute \
    && rm -rf /var/lib/apt/lists/*

CMD /bin/bash
