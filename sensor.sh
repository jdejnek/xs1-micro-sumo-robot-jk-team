#!/bin/bash

PORT=$(arduino-cli board list | grep "usbmodem\|usbserial" | head -n 1 | awk '{print $1}') 

if [ -z "$PORT" ]; then
  echo "Error: No Arduino board detected for monitoring."
  exit 1
fi

arduino-cli monitor -p "$PORT" --config baudrate=9600
