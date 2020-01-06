#! /bin/bash

FORGE_SERVER=$HOME/forge-1.12.2-14.23.5.2768-universal.jar

if [ ! -f $FORGE_SERVER ]; then
    cp -r $SNAP/serverImage/* $HOME/
fi

java -Xms128m -Xmx3500m -jar "$FORGE_SERVER" "$0"
