#!/bin/sh
# Count the number of arguments
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 (build|up|down|ps|attach-p|attach-w)" 1>&2
  exit 1
fi

if [ $# = 1 ]; then
    ret=$1

    if [ "$ret" == "up" ]; then
        docker-compose up -d
    elif [ "$ret" == "down" ]; then
        docker-compose down
    elif [ "$ret" == "attach-p" ]; then
        PAPERMC_CONTAINER_ID=$(docker-compose ps -q papermc)
        docker attach $PAPERMC_CONTAINER_ID
    elif [ "$ret" == "attach-w" ]; then
        WATERFALL_CONTAINER_ID=$(docker-compose ps -q waterfall)
        docker attach $WATERFALL_CONTAINER_ID
    elif [ "$ret" == "ps" ]; then
        docker-compose ps
    elif [ "$ret" == "build" ]; then
        docker-compose build --build-arg UID="`id -u`" --build-arg GID="`id -g`"
    else
        echo "Error: Specified option '" + $1 + "' is not valid."
        exit 1
    fi
fi
