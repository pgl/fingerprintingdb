#!/bin/bash

if [ ! "$1" ]
then
    echo "no file provided"

    exit 1
fi

file="$1"

grep -qi '/fingerprint(js|-video)' "$file" ||
grep -qi '/fingerprint[23]\.js' "$file" ||
grep -qi '/event/fingerprint' "$file"
