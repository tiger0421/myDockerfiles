FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates\
        sudo \
        openssh-server \
        wget \
        libnotify4 \
        gnupg \
        libxkbfile1 \
        libsecret-1-0 \
        libgtk-3-0 \
        libxss1 \
        libnss3 \
        libx11-xcb-dev \
        libxtst6 \
        libasound2 \
        xauth \
        iputils-ping \
    && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

RUN apt update && \
    apt install -y x11-apps && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

ENV LANG=ja_JP.UTF-8


CMD ["sudo","bash","-c", "bash"]
