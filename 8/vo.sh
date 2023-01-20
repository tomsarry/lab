#!/bin/sh

# Usage:
#   ./vo.sh <file>
#   Returns the number of lines that do not contain 'i' or 'o'.

if [ $# -lt 1 ]; then
  echo "$0: illegal number of parameters"
  exit 1
fi

filename=$1

if [[ ! -f $filename ]]; then
  echo "$0: invalid file '$filename'"
  exit 1
fi

awk '!/i|o/ {print}' $filename | wc -l
