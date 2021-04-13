#!/bin/bash

## Checks against any of the known scripts from the FP Inspector research
##
##  https://raw.githubusercontent.com/uiowa-irl/FP-Inspector/master/Data/fingerprinting_domains.json
##

if [ ! "$1" ]
then
    echo "no file provided"

    exit 1
fi

file="$1"


thisdir=$(dirname "$0")

grep -q -f "$thisdir/assets/fpscriptnames.txt" -F "$file"
