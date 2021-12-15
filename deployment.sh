#!/usr/bin/env bash

ROOT_DIR=$(cd "$(dirname "$0")"; pwd)

sleepnow () {
  sleep infinity
}

ENV=$ROOT_DIR/env

if [ ! -d "$ENV" ]; then
    echo "ENV not found"
    sleepnow
fi

set -a
. $ROOT_DIR/env.txt
set +a

LOGSTASH_DIR=$ROOT_DIR/logstash/config

if [ ! -d "$LOGSTASH_DIR" ]; then
  echo "Cannot find logstash config directory: $LOGSTASH_DIR"
  sleepnow
fi

LOGSTASH_DEST=$HOSTFILES/opt/logstash/config

mkdir -p $LOGSTASH_DEST

cp -r $LOGSTASH_DIR/* $LOGSTASH_DEST


KIBANA_DIR=$ROOT_DIR/kibana/config/kibana.yml

if [ ! -d "$KIBANA_DIR" ]; then
  echo "Cannot find kibana config directory: $KIBANA_DIR"
  sleepnow
fi

KIBANA_DEST=$HOSTFILES/kibana/config/kibana.yml

mkdir -p $KIBANA_DEST

cp -r $KIBANA_DIR/* $KIBANA_DEST
