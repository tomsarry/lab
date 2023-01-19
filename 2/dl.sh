#!/bin/sh

# Usage:
#   ./dl.sh <target> <file1> [<file2> ...]
#   Removes all lines containing the word <target> in the specified files.

if [ $# -lt 2 ]; then
  echo "$0: illegal number of parameters"
  exit 1
fi

word=$1
tmp=dl.tmp
shift 1

# Only filenames left in argument list
for filename in $@; do
  if [[ ! -f $filename ]]; then
    echo "$0: couldn't find file '$filename'"
    exit 1
  fi
  
  sed "/$word/d" $filename | tee $tmp &> /dev/null
  mv $tmp $filename
done

