#!/bin/bash

# edit accordingly to point to the path of the NegBio directory
export PYTHONPATH="/home/FYP/angk0064/NegBio":$PYTHONPATH

mkdir -p output

# just copy the input files into the root directory
find . -maxdepth 1 -name "*.csv" -type f | while read -r f; do
  # Ignore the sample files
  if [[ "$f" == "./sample_reports.csv" || "$f" == "./labeled_reports.csv" ]]; then
    continue
  fi

  # saves the output file to the output directory
  python ./label.py --reports_path "$f" --output_path "output/$f"

  echo "$f"
done
