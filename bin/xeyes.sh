#!/bin/bash

XAUTH_FILENAME="${BASH_SOURCE%/*}/../.Xauthority.xeyes"

touch $XAUTH_FILENAME
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH_FILENAME \
	nmerge -
chmod +r $XAUTH_FILENAME

docker-compose run --rm xeyes

rm $XAUTH_FILENAME
