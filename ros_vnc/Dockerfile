FROM fredblgr/ubuntu-novnc:20.04-arm64
ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's#http://tw.archive.ubuntu.com/#http://archive.ubuntu.com/#' /etc/apt/sources.list && \
  apt update && \
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
    ros-noetic-desktop-full \
    python3-rosdep \
    && \
  bash -c '. /opt/ros/noetic/setup.bash; rosdep init; rosdep update' && \
  echo 'source /opt/ros/noetic/setup.bash' >> /root/.bashrc && \
  echo 'source /opt/ros/noetic/setup.bash' >> /home/ubuntu/.bashrc && \
  apt autoremove -y && \
  apt clean && \
  rm -rf /var/lib/apt/lists/*
