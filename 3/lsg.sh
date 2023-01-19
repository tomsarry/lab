#!/bin/sh

# Usage:
#   lsg
#   Lists all files in the current directory
#       for which the user has read, write and execute permissions.

for f in '.'/*; do
  perm=`ls -l $f`
  if [[ "$perm" =~ ^-rwx ]]; then
    # print filename whithout first 2 chars
    echo $f | cut -c 3-
  fi
done