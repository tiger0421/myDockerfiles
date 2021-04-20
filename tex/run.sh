#!/bin/bash
docker run --name tex --rm -it -v ~/share:/home/ubuntu/share -e DISPLAY=$DISPLAY_MAC tex:20.04 bash
