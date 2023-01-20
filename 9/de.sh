#!/bin/sh

# Usage:
#   ./de.sh <file>
#   Returns the number of lines, words and characters in <file>.

if [ $# -lt 1 ]; then
  echo "$0: illegal number of parameters"
  exit 1
fi

filename=$1

if [[ ! -f $filename ]]; then
  echo "$0: invalid file '$filename'"
  exit 1
fi

lines=`awk '{print}' $filename | wc -l`
words=`awk '{print}' $filename | wc -w`
chars=`awk '{print}' $filename | wc -m`

echo $filename
echo "lines: $lines"
echo "words: $words"
echo "chars: $chars"

