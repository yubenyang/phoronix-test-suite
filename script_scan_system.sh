#!/bin/bash

APP_LIST="test_names_system.txt"
RESULT_DIR="results_system"
mkdir -p "$RESULT_DIR"

for i in $(seq 1 42); do
  TEST_NAME="$(sed -n "${i}p" "$APP_LIST" | tr -d '\r')"
  ./script_run.sh "$RESULT_DIR" "$TEST_NAME"
done
