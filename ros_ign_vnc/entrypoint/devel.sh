#!/bin/bash
set -e
source "/opt/ros/noetic/setup.bash"
source "/preinstall/devel/setup.bash"
exec "$@"
