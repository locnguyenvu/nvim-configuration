#!/usr/bin/env bash
INPUT="$@"

FILEPATH=$(echo "$@" | grep -oE '[a-zA-Z0-9]+(\-|_)*(/[a-zA-Z0-9]+.*)*\.[a-zA-z0-9]{1,5}')
DEFINEPATTERN=$(echo "$@" | grep -oE '\/\^.*/\;' | grep -oE '[^\/\^[:space:]].*[^\$\/;]')

LINE=$(grep -nF "${DEFINEPATTERN}" "${FILEPATH}" | cut -d: -f 1)
LINERANGE="$((LINE-2))"
bat -f $FILEPATH -H $LINE -r "$LINERANGE:" --style=plain
