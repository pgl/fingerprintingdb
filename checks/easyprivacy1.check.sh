#!/bin/bash

## Checks for rules from EasyPrivacy
##
## https://easylist.to/easylist/easyprivacy.txt
##

if [ ! "$1" ]
then
    echo "no file provided"

    exit 1
fi

file="$1"

grep -qi '_fingerprint_id' "$file" ||
grep -qi 'dsc\.fingerprint-' "$file" ||
grep -qi 'DeviceFingerprintWeb' "$file" ||
grep -qi '/js/grin-sdk.js' "$file"
