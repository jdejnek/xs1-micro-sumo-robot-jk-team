#!/bin/bash

PORT=$(arduino-cli board list | grep "usbmodem\|usbserial" | awk '{print $1}') && arduino-cli monitor -p "$PORT" --config baudrate=9600
