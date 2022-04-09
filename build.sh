#!/usr/bin/env bash

DIR=$(dirname $(realpath "$0"))
cd $DIR
set -ex

GOOS=js GOARCH=wasm go build -o lib.wasm .
