#!/bin/sh

# Usage:
#   ./ld.sh <dir>
#   List all directories in directory <dir>

if [ $# -lt 1 ]; then
  echo "$0: illegal number of parameters"
  exit 1
fi

root=$1

if [[ ! -d $root ]]; then
  echo "$0: not a directory '$root'"
  exit 1
fi

for f in $root/*; do
  if [[ -d $f ]]; then
    echo $f | cut -c 3-
  fi
done