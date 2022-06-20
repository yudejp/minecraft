#!/bin/bash
# Count the number of arguments
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 (build|up|down|ps|attach-p|attach-w|shell-p|shell-w|shell-db|git-ls)";
  echo "For detailed information, please run '$0 help'." 1>&2

  exit 1
fi

if [ $# = 1 ]; then
    ret=$1

    if [ "$ret" == "help" ]; then
        echo "Showing the help of $0."
        echo "The list of available commands:"
        echo "  * build: Pulls and builds all of containers"
        echo "  * ps: Shortcut to docker-compose ps"
        echo "  * up: Start all containers"
        echo "  * down: Stop all containers"
        echo "  * attach-p: Attach to PaperMC's console"
        echo "  * attach-w: Attach to Waterfall's console"
        echo "  * shell-p: Open the shell of PaperMC container"
        echo "  * shell-w: Open the shell of Waterfall container"
        echo "  * shell-db: Open the shell of MariaDB container"
        
    elif [ "$ret" == "up" ]; then
        docker-compose up -d --remove-orphans
    elif [ "$ret" == "down" ]; then
        docker-compose down
    elif [ "$ret" == "attach-p" ]; then
        PAPERMC_CONTAINER_ID=$(docker-compose ps -q paper)
        docker attach $PAPERMC_CONTAINER_ID
    elif [ "$ret" == "attach-w" ]; then
        WATERFALL_CONTAINER_ID=$(docker-compose ps -q waterfall)
        docker attach $WATERFALL_CONTAINER_ID
    elif [ "$ret" == "shell-p" ]; then
        PAPERMC_CONTAINER_ID=$(docker-compose ps -q paper)
        docker exec -it $PAPERMC_CONTAINER_ID sh
    elif [ "$ret" == "shell-w" ]; then
        WATERFALL_CONTAINER_ID=$(docker-compose ps -q waterfall)
        docker exec -it $WATERFALL_CONTAINER_ID sh
    elif [ "$ret" == "shell-db" ]; then
        DB_CONTAINER_ID=$(docker-compose ps -q db)
        docker exec -it $DB_CONTAINER_ID sh
    elif [ "$ret" == "ps" ]; then
        docker-compose ps
    elif [ "$ret" == "build" ]; then
        docker-compose pull
        docker-compose build --build-arg UID="`id -u`" --build-arg GID="`id -g`"
    elif [ "$ret" == "git-ls" ]; then
        git ls-files -v | grep "^h"
    else
        echo "Error: Specified option '$1' is not valid."
        exit 1
    fi
fi
