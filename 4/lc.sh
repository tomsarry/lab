#!/bin/sh

# Usage:
#   ./lc.sh <file1|dir1> [<file2|dir2> ...]
#   Specifies for each argument if it is a directory, or a file.
#   For files, also provides the number of lines.

if [ $# -lt 1 ]; then
  echo "$0: illegal number of parameters"
  exit 1
fi

for filename in $@; do
  if [[ -f $filename ]]; then
    lines=`cat $filename | wc -l`
    echo "- file: $filename, $lines lines"
    elif [[ -d $filename ]]; then
    echo "- directory $filename"
  fi
done
