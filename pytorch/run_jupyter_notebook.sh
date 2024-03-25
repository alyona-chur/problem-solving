#!/bin/bash

IMAGE_NAME='problem-solving'
DOCKERFILE_PATH='cpu.Dockerfile'

# Build command and run
cmd="docker run "
cmd+="-u $(id -u):$(id -g) "
cmd+="--mount type=bind,source=$(pwd),destination=/usr/src/app "
cmd+="-it "
cmd+="--rm "
cmd+="--name problem-solving-$(whoami) "
cmd+="-p 10171:10171 "
cmd+="${IMAGE_NAME} "
cmd+="/bin/bash -c \"jupyter notebook --no-browser --port=10171 --ip=0.0.0.0\""

echo "$cmd"  && \
eval "$cmd"
