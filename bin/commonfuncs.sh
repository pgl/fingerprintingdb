set -e

function getsite() {
    ## gets site name from WARC file
    ##

    local warcfile="$1"

    grep '^Host: ' "$warcfile" \
        | head -n 1 \
        | cut -f2 -d' ' \
        | perl -pe 's/\cM//'
}


function geturl() {
    ## get URL from WARC file
    ##

    local warcfile="$1"

    grep '^WARC-Target-URI: ' "$warcfile" \
		| head -n 1 \
		| cut -f2 -d' ' \
		| perl -pe 's/\cM//'
}


function warcfilename() {
    ## figure out WARC filename from URL
    local url="$1"

    hash=$(echo "$url" | sha256sum | cut -f1 -d' ')

    echo "$hash.warc"
}
