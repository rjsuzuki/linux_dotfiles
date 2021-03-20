#!/bin/bash

figlet -c Test

echo "Test"
if [ $1 == 1 ]; then
  echo "Test is good!"
fi
