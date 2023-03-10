#!/bin/sh

# Usage:
#   ./fd.sh <file> <start> <end>
#   Print lines number <start> to <end> of <file>.

if [ $# -ne 3 ];
then
  echo "$0: illegal number of parameters"
  exit 1
fi

count=0
filename=$1
start=$2
end=$3

if [ ! -f $filename ]; then
  echo "fd: invalid file"
  exit 1
fi

re='^[0-9]+$'
if [[ ! ($start =~ $re && $end =~ $re) ]]; then
  echo "fd: illegal parameter types, expected integers"
  exit 1
fi

while read -r line; do
  ((count++))
  
  if [ $count -lt $start ]; then
    continue
    elif [ $count -gt $end ]; then
    break
  fi
  
  echo $line
done < $filename