#!/bin/bash
docker run --rm -it --privileged -v /dev:/dev -v ${PWD}:/build mkaczanowski/packer-builder-arm:latest build raspberrypi.json
notify-send 'Finished Image Building'