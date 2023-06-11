#!/usr/bin/env bash

main() {
  sudo docker build -t docker.io/blairy/terraformer:latest .
  sudo docker push docker.io/blairy/terraformer:latest
}

main
