#!/bin/bash

cd `dirname $0`/..

# default parameters
NO_CACHE="--no-cache"
LOCAL_FILE="false"
GIT_BRANCH="dev"
TAG="dev"

# parse arguments
OPTS=$(getopt --options u:,p:,_,b:,t: \
              --longoptions username:,password:,cache,git-branch:,tag: \
              -- "$@")

while true
do
  case $1 in
    -u | --username )
        USERNAME="$2"
        shift 2
        ;;
    -p | --password )
        PASSWORD="$2"
        shift 2
        ;;
    --cache )
        NO_CACHE=""
        shift 1
        ;;
    -b | --git-branch )
        GIT_BRANCH="$2"
        shift 2
        ;;
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


# docker login
if [ -n "${USERNAME}" ] && [ -n "${PASSWORD}" ]; then
    docker login --username ${USERNAME} --password ${PASSWORD}
fi

# docker build
docker build \
    ${NO_CACHE} \
    --build-arg GIT_BRANCH=${GIT_BRANCH} \
    -f build/Dockerfile \
    -t soh-aiagent:${TAG} \
    .