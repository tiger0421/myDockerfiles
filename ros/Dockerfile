FROM --platform=linux/arm64/v8 ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
      wget \
      software-properties-common \
      lsb-release \
      dirmngr --install-recommends \
      && \
    echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list && \
    wget http://packages.ros.org/ros.key -O - | apt-key add - && \
    apt update && \
    apt install -y \
      ros-noetic-desktop \
      python3-rosdep \
      && \
    bash -c '. /opt/ros/noetic/setup.bash; rosdep init; rosdep update' && \
    echo 'source /opt/ros/noetic/setup.bash' >> /root/.bashrc && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
