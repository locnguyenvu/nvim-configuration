#!/usr/bin/env bash
INPUT="$@"

FILEPATH=$(echo "$@" | awk -F '[[:space:]]+' '{print $2}')
DEFINEPATTERN=$(echo "$@" | grep -oE '\/\^.*/\;' | grep -oE '[^\/\^[:space:]].*[^\$\/;]')

LINE=$(grep -nF "${DEFINEPATTERN}" "${FILEPATH}" | cut -d: -f 1)
LINERANGE="$((LINE-2))"
bat -f $FILEPATH -H $LINE -r "$LINERANGE:" --style=plain
