#!/bin/sh

# SET THE ANTENNA TO BE THE EXTERNAL ONE
set_antenna ufl

# MAKE DIRECTORY FOR PICTURES
mkdir -p /mnt/pictures
mkdir -p /mnt/tmp_images

# REMOVE ANY PREVIOUS INSTANCE OF THE CONTAINER
docker rm claptto

# PULL THE LATEST
docker pull xtacocorex/chiptainer_claptto

# REMOVE OLD CONTIANER
docker rmi `docker images | grep chiptainer_claptto | grep "<none>" | tr -s " " | cut -d " " -f 3`

# RUN THE CONTAINER
docker run \
         --rm \
         -it \
         --name claptto \
         --privileged \
         --cap-add SYS_RAWIO \
         --device /dev/mem \
         --device /dev/video0 \
         -v /sys:/sys \
         --volume=/mnt/pictures:/mnt/pictures \
         xtacocorex/chiptainer_claptto:latest
