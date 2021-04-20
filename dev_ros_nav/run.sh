#!/bin/bash
docker run --name wp -it -v ~/prog/waypoint_nav:/root/wp_ws/src/waypoint_nav -v ~/share:/root/share -e DISPLAY=$DISPLAY_MAC -w /root/wp_ws ros:noetic bash
