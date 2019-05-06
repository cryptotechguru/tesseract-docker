#!/bin/sh
TAG=`git rev-parse --short HEAD`
docker image build -t macterra/tesseract-node:$TAG .
docker image tag macterra/tesseract-node:$TAG macterra/tesseract-node:latest
docker image tag macterra/tesseract-node:$TAG macterra/tesseract-node:v0.05.06

