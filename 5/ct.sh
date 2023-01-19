#!/bin/sh

# Usage:
#   ./ct.sh <file1> [<file2> ...]
#   Count and report the occurence of each word in <file1> in the rest of the provided files.

if [ $# -lt 1 ]; then
  echo "$0: illegal number of parameters"
  exit 1
fi

base=$1
count=0

if [[ ! -f $base ]]; then
  echo "$0: not a valid file '$base'"
  exit 1
fi

shift 1

for filename in $@; do
  if [[ ! -f $filename ]]; then
    echo "$0: not a valid file '$filename'"
    exit 1
  fi
  
  echo "$filename:"
  
  while read line; do
    for word in $line; do
      grep $word $filename && ((count++))
    done
  done < $base
  
  if [ $count -eq 1 ]; then
    echo "$count occurence"
    echo
  else
    echo "$count occurences"
    echo
  fi
  
  ((count=0))
done
