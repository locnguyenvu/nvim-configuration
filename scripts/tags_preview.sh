#!/usr/bin/env bash
INPUT="$@"

declare -a FOO
FOO=( 'a' )

FILETYPES='(php|py)'
FILEPATH=$(echo "$@" | grep -oE '[a-zA-Z0-9]+(\-|_)*(/[a-zA-Z0-9]+.*)*\.'+"${FILETYPES}")
echo ""

DEFINEPATTERN=$(echo "$@" | grep -oE '\/\^.*\$\/\;' | grep -oE '[^\/\^[:space:]].*\$' | sed 's/\$$//g')
LINE=$(grep -nF "${DEFINEPATTERN}" "${FILEPATH}" | cut -d: -f 1)
LINERANGE="$((LINE-2))"
bat -f $FILEPATH -H $LINE -r "$LINERANGE:"