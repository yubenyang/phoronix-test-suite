#!/usr/bin/env python3
import json
import sys
from pathlib import Path

# Usage: python extract_test_keys.py benchmarks.json test_names.txt
# Defaults if not provided:
input_path = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("benchmarks.json")
output_path = Path(sys.argv[2]) if len(sys.argv) > 2 else Path("test_names.txt")

with input_path.open("r", encoding="utf-8") as f:
    data = json.load(f)

tests = data.get("tests", {})
keys = list(tests.keys())

with output_path.open("w", encoding="utf-8") as f:
    for k in keys:
        f.write(k + "\n")

print(f"Wrote {len(keys)} test keys to {output_path}")
