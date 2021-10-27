#!/bin/bash
docker run --name dev-noetic -it -v ~/prog/waypoint_nav:/home/ubuntu/catkin_ws/src/waypoint_nav -v ~/share:/home/ubuntu/share -e DISPLAY=$DISPLAY_MAC -w /home/ubuntu dev_ros_nav:noetic bash
