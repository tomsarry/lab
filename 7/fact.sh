#!/bin/sh

# Usage:
#   ./fact.sh N
#   Computes the factorial of N.

fact() {
  if (($1 <= 1)); then
    echo 1
  else
    last=$(fact $(($1-1)))
    echo $(($1 * $last))
  fi
}

if [ $# -lt 1 ]; then
  echo "$0: illegal number of parameters"
  exit 1
fi

n=$1

if [[ ! $n =~ ^[0-9]+$ ]]; then
  echo "$0: illegal argument"
  exit 1
fi
fact $n