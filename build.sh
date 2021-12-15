#!/bin/bash

docker run \
  --rm \
  -v "$(pwd)/opt:/build" \
  -v "$(pwd)/container:/var/task" \
  --entrypoint /var/task/build_lib.sh \
  lambci/lambda-base-2:build

(
  rm layer.zip

  cd opt || exit 1
  zip --recurse-paths --symlinks ../layer.zip ./*
)
