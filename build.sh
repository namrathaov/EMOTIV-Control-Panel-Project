#!/bin/sh

SCRIPT_PATH=$(readlink"$0")
ROOT_PATH=$(dirname "$SCRIPT_PATH")

LIB_PATH="$ROOT_PATH/lib"

cd $ROOT_PATH

echo
echo "Removing server.jar and client.jar"
echo

rm server.jar
rm client.jar

echo
echo "Starting build..."
echo

javac -d . -cp ".:$ROOT_PATH/src:$LIB_PATH/grizzly-framework-2.3.3.jar:$LIB_PATH/grizzly-http-2.3.3.jar:$LIB_PATH/grizzly-http-server-2.3.3.jar:$LIB_PATH/grizzly-rcm-2.3.3.jar:$LIB_PATH/javax.json-1.0.4.jar:$LIB_PATH/javax.websocket-api-1.0.jar:$LIB_PATH/jcommon-1.0.16.jar:$LIB_PATH/jfreechart-1.0.13.jar:$LIB_PATH/tyrus-client-1.1.jar:$LIB_PATH/tyrus-container-grizzly-1.1.jar:$LIB_PATH/tyrus-core-1.1.jar:$LIB_PATH/tyrus-server-1.1.jar:$LIB_PATH/tyrus-spi-1.1.jar:$LIB_PATH/tyrus-websocket-core-1.1.jar" $ROOT_PATH/src/view/server/Server.java

jar cfm server.jar ./manifest/server_manifest.txt lib src network util view controller
rm -rf server

javac -d . -cp ".:$ROOT_PATH/src:$LIB_PATH/grizzly-framework-2.3.3.jar:$LIB_PATH/grizzly-http-2.3.3.jar:$LIB_PATH/grizzly-http-server-2.3.3.jar:$LIB_PATH/grizzly-rcm-2.3.3.jar:$LIB_PATH/javax.json-1.0.4.jar:$LIB_PATH/javax.websocket-api-1.0.jar:$LIB_PATH/jcommon-1.0.16.jar:$LIB_PATH/jfreechart-1.0.13.jar:$LIB_PATH/tyrus-client-1.1.jar:$LIB_PATH/tyrus-container-grizzly-1.1.jar:$LIB_PATH/tyrus-core-1.1.jar:$LIB_PATH/tyrus-server-1.1.jar:$LIB_PATH/tyrus-spi-1.1.jar:$LIB_PATH/tyrus-websocket-core-1.1.jar" $ROOT_PATH/src/view/client/Client.java

jar cfm client.jar ./manifest/client_manifest.txt lib src network util view controller
rm -rf client
rm -rf network
rm -rf util
rm -rf model
rm -rf view
rm -rf controller

echo
echo "Build Complete."
echo