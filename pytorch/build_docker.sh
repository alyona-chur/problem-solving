#!/bin/bash

IMAGE_NAME='problem-solving'
DOCKERFILE_PATH='cpu.Dockerfile'

cmd="docker build "
cmd+="-t ${IMAGE_NAME} "
cmd+="-f ${DOCKERFILE_PATH} "
cmd+="."

echo "$cmd" && \
eval "$cmd"
