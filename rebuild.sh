#!/bin/sh
TAG=`git rev-parse --short HEAD`
docker image build -t macterra/tesseract-node:$TAG .
