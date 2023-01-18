#!/bin/sh

while getopts ":h" opt; do
    case $opt in
        h)
            echo "Usage: fd SOURCE START END"
            echo "Print lines number START to END of SOURCE."
            exit 0
        ;;
        \?)
            echo "fd: unknown flag"
            echo "Try 'fd -h' for more information."
            exit 1
        ;;
    esac
done

if [ $# -ne 3 ];
then
    echo "fd: illegal number of parameters"
    echo "Try 'fd -h' for more information."
    exit 1
fi

count=0
filename=$1
start=$2
end=$3

while read -r line; do
    ((count++))
    
    if [ $count -lt $start ]; then
        continue
        elif [ $count -gt $end ]; then
        break
    fi
    
    echo $line
done < $filename