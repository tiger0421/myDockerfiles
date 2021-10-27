FROM ubuntu:20.04

RUN apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends \
        meld\
    && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

CMD meld
