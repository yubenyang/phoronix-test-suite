#!/bin/bash

APP_LIST="test_names_pts.txt"
RESULT_DIR="results_pts"
mkdir -p "$RESULT_DIR"

for i in $(seq 1 548); do
  TEST_NAME="$(sed -n "${i}p" "$APP_LIST" | tr -d '\r')"
  ./script_run.sh "$RESULT_DIR" "$TEST_NAME"
done
