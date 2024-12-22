#!/bin/bash

cd `dirname $0`/..

# parse arguments
OPTS=$(getopt --options t: \
              --longoptions tag: \
              -- "$@")

while true
do
  case "$1" in
    -t | --tag )
        TAG="$2"
        shift 2
        ;;
    --)
        shift
        break
        ;;
    *)
        echo "Unexpected option: $1"
        break
        ;;
  esac
done

if [ -z "${TAG}" ]; then
    echo "Please set the docker image tag with -t or --tag options."
    exit 1
fi

HOST_DIR=`pwd`
CTNR_DIR=/home/SoH_AIAgent
CTNR_NAME=soh-aiagent

docker run \
    -it --rm \
    -p 8501:8501 \
    --volume ${HOST_DIR}:${CTNR_DIR} \
    --workdir ${CTNR_DIR} \
    --name ${CTNR_NAME} \
    --entrypoint scripts/run.sh \
    soh-aiagent:${TAG}