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
    # Filename without the . prefix
    df="$dotdir/$f"

    # If exists delete
    if [ -e "$df" ]; then
        echo "Deliting old $df file"
        if [ -d "$df" ]; then
            rm -rf "$df"
        else
            rm "$df"
        fi
    fi

    # Copy the file to the dotfiles directory
    if [ -d ~/."$f" ]; then
        cp -r ~/."$f" "$df"
    else
        cp ~/."$f" "$df"
    fi
done

