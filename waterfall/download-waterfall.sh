#!/bin/sh

cd /build

# Fetch URL
URL=https://papermc.io/api/v2/projects/waterfall
MC_VERSION=$(wget -qO - $URL | jq -r '.versions[-1]')
URL=${URL}/versions/${MC_VERSION}
BUILD=$(wget -qO - $URL | jq '.builds[-1]')
JAR_NAME=waterfall-${MC_VERSION}-${BUILD}.jar
URL=${URL}/builds/${BUILD}/downloads/${JAR_NAME}

# Download paper.jar
wget ${URL} -O waterfall.jar