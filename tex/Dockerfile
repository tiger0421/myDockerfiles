FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        sudo \
        gosu \
        tzdata \
        wget \
        xdvik-ja \
        evince \
        texlive-full \
    && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

ENV TZ=Asia/Tokyo 
ENV LANG=ja_JP.UTF-8

RUN tlmgr init-usertree
RUN kanji-config-updmap-sys ipaex

RUN useradd --create-home --home-dir /home/ubuntu --shell /bin/bash --user-group --groups adm,sudo ubuntu && \
    echo ubuntu:ubuntu | chpasswd && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER ubuntu
WORKDIR /home/ubuntu

CMD ["sudo","bash","-c", "bash"]
