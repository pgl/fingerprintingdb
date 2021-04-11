#!/bin/bash

if [ ! "$1" ]
then
    echo "no file provided"

    exit 1
fi

file="$1"

grep -qi fingerprintjs "$file"
