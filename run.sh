#!/bin/bash

args="$@"

args="--watch $@ -H 0.0.0.0 -p $PORT"
./Syncbackup.sh 10 &
json-server $args 
