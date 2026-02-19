#!/bin/bash
set -e

PORT=$(arduino-cli board list | grep "usbmodem\|usbserial" | head -n 1 | awk '{print $1}')

if [ -z "$PORT" ]; then
  echo "Error: No Arduino board detected (expected usbmodem or usbserial). Is it plugged in?"
  exit 1
fi

echo "Found board at $PORT"
arduino-cli compile --fqbn arduino:avr:leonardo XS1-Micro-Sumo-Robot-Code/
arduino-cli upload -p "$PORT" --fqbn arduino:avr:leonardo XS1-Micro-Sumo-Robot-Code/
echo "Done! Sketch flashed to $PORT"
