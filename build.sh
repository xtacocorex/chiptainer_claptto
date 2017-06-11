#!/bin/sh

CONTAINER_IMAGE=${CONTAINER_IMAGE:-chiptainer_claptto}

case "$1" in
    build)
        docker build --no-cache=true -t "${CONTAINER_IMAGE}" .
        ;;
    tag)
        docker tag chiptainer_claptto xtacocorex/chiptainer_claptto
        ;;
    push)
        docker push xtacocorex/chiptainer_claptto
        ;;
    all)
        echo "BUILDING"
        docker build --no-cache=true -t "${CONTAINER_IMAGE}" .
        echo "TAGGING"
        docker tag chiptainer_claptto xtacocorex/chiptainer_claptto
        echo "PUSHING"
        docker push xtacocorex/chiptainer_claptto
        ;;
    remove-tags)
        docker rmi `docker images | grep chiptainer_claptto | grep "<none>" | tr -s " " | cut -d " " -f 3`
        ;;
esac
