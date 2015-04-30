#!/bin/bash

VERSION_FILE='README.md'
VERSION_TEMP='README.tmp'

function usage () {
    echo "usage: bump-version <version-id>"
}

function update_version () {
    sed -e "s/^    Version: .*$/    Version: $1/g" \
        $VERSION_FILE > $VERSION_TEMP
}

function commit_version () {
    git add $VERSION_FILE
    git commit -m "Bumped version number to $1."
}

if [ $# -ne 1 ]; then
    usage
    exit 1
fi

if ! update_version $1; then
    echo "Could not bump the version!" >&2
    exit 2
else
    mv $VERSION_TEMP $VERSION_FILE
fi

if ! commit_version $1; then
    echo "Could not commit the version!" >&2
    exit 2
fi
