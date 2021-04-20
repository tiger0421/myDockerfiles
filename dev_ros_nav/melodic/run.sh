#!/bin/bash
docker run --name test -it -v ~/prog/waypoint_nav:/home/ubuntu/catkin_ws/src/waypoint_nav -v ~/share:/home/ubuntu/share -e DISPLAY=$DISPLAY_MAC -w /home/ubuntu ros:melodic bash
