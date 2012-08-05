#!/bin/bash

PREFIX="$1"

if [ -z "$PREFIX" ] ; then
    echo "Usage: $0 directory"
    exit 1
fi

for file in `ls -A "$PREFIX/"`; do
    name=$(basename $file .gpg)
    gpg --decrypt "$PREFIX/$file" > "$HOME/$name"
done
