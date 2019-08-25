#!/bin/bash
#######################################################################
# backup.sh
# Script to backup sistem dot files
#######################################################################

#### Secure bash script options
set -euo pipefail

#### Variables
SCRIPT_DIR=$(readlink -f ${BASH_SOURCE[0]})
WRK_DIR=$(dirname "$SCRIPT_DIR")
dotdir=$WRK_DIR

# list of files and dirs to backup/replace
files=$(cat "$dotdir/dotfiles.txt")


#### Script start

# Repeat the action for all configured files
for f in $files; do
    # System (dotted) filename
    df=~/."$f"
    # Versioned (undotted) filename
    uf="$dotdir/$f"

    # If exists delete
    if [ -e "$uf" ]; then
        echo "Deliting old $uf file"
        if [ -d "$uf" ]; then
            rm -rf "$uf"
        else
            rm "$uf"
        fi
    fi

    # Copy the file to the dotfiles directory
    mkdir -p $(dirname "$uf")
    if [ -d "$df" ]; then
        cp -r "$df" "$uf"
    else
        cp "$df" "$uf"
    fi
done

