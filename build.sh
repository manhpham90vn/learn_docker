#!/bin/bash

FILE=$1
VERSION=$2
USER=manhpv151090

docker build . -t $FILE:latest -f $FILE
docker tag $FILE:latest $USER/$FILE:$VERSION
docker tag $FILE:latest $USER/$FILE:latest
docker push $USER/$FILE:$VERSION
docker push $USER/$FILE:latest
