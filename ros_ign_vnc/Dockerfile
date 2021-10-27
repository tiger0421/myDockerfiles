FROM fredblgr/ubuntu-novnc:20.04-arm64
ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i 's#http://tw.archive.ubuntu.com/#http://archive.ubuntu.com/#' /etc/apt/sources.list \
    && apt update \
    && apt upgrade -y \
    && . /etc/os-release \
    && apt install -y \
        dirmngr \
        gnupg2 \
        lsb-release \
        wget \
        software-properties-common \
    && echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list \
    && wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add - \
    && add-apt-repository -y ppa:ubuntu-x-swat/updates \
    && apt update \
    && apt dist-upgrade -y \
    && apt upgrade -y \
    && apt install -y --no-install-recommends \
        ignition-dome \
    && apt --purge remove -y \
        dirmngr \
        gnupg2 \
        lsb-release \
        wget \
        software-properties-common \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

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
      ros-noetic-desktop-full \
      python3-rosdep \
      && \
    bash -c '. /opt/ros/noetic/setup.bash; rosdep init; rosdep update' && \
    echo 'source /opt/ros/noetic/setup.bash' >> /root/.bashrc && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY preinstall.repos.yaml /tmp/.
ENV IGNITION_VERSION=dome

RUN apt update --quiet \
    && apt install --quiet --no-install-recommends -y \
      python3-vcstool \
      git \
      apt-utils \
    && rm /etc/ros/rosdep/sources.list.d/20-default.list \
    && /bin/bash -c "source /opt/ros/noetic/setup.bash" \
    && mkdir -p /preinstall/src \
    && vcs import /preinstall/src < /tmp/preinstall.repos.yaml \
    && /opt/ros/noetic/env.sh \
    rosdep install \
        --rosdistro noetic \
        --from-paths /preinstall/src \
        --ignore-src \
        --skip-keys=ignition-gazebo2 \
        --skip-keys=ignition-gazebo3 \
        --skip-keys=ignition-msgs4 \
        --skip-keys=ignition-msgs5 \
        --skip-keys=ignition-rendering2 \
        --skip-keys=ignition-rendering3 \
        --skip-keys=ignition-sensors2 \
        --skip-keys=ignition-sensors3 \
        --skip-keys=ignition-transport7 \
        --skip-keys=ignition-transport8 \
        -r -y \
    && apt --purge remove -y \
        python3-vcstool \
        git \
        apt-utils \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt update --quiet \
    && apt install --quiet --no-install-recommends -y \
        g++-8 \
        python3-catkin-tools \
    && cd /preinstall \
    && sh -c "\
    CXX=g++-8 \
    && . /opt/ros/noetic/setup.sh \
    && catkin build \
        --save-config \
        --no-status \
        --no-notify \
        --no-summarize \
        --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo" \
    && rm -rf build logs \
    && apt --purge remove -y \
        g++-8 \
        python-catkin-tools \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

RUN echo "source /preinstall/devel/setup.bash" >> /root/.bashrc
RUN echo "source /preinstall/devel/setup.bash" >> /home/ubuntu/.bashrc

CMD ["/bin/bash"]
