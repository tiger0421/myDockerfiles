#!/bin/bash
docker run --name ros -it -v ~/share:/root/share -e DISPLAY=$DISPLAY_MAC -w /root ros:noetic bash
