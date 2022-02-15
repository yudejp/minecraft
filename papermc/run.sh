#!/bin/sh
cd /app

exec java -server ${JAVA_OPTS} -jar /bin/paper.jar