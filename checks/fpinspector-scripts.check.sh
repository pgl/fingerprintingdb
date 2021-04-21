#!/bin/bash

## Checks against some of the known scripts from the FP Inspector research
##
##  https://raw.githubusercontent.com/uiowa-irl/FP-Inspector/master/Data/fingerprinting_domains.json
##
## Needed cleaning as there were entries like:
##
##    "b9505169dd0162609b94dc6d737eecc6": [
##        {
##            "script_url": "https://www.flickr.com/",
##            "top_url": "https://www.flickr.com/"
##        }
##    ],
##
## As a result, checked for number of occurrences of each script from the
## above URL, and just took everything with more than 25 or more counts.
##
##

if [ ! "$1" ]
then
    echo "no file provided"

    exit 1
fi

file="$1"

opts=''

[[ $2 == '-v' ]] || opts=' -q'

thisdir=$(dirname "$0")

#grep -q -f "$thisdir/assets/fpscriptnames.txt" -F "$file"
grep $opts -f "$thisdir/assets/fpscriptnames.txt" -F "$file"
