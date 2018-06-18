#!/bin/bash

trap 'exit' SIGINT

while true; do
  nc -l -p 80 -c ./http200.sh
done

