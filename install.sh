#!/bin/bash
#######################################################################
# install.sh
# Script to copy personalized dot files
#######################################################################

#### Secure bash script options
set -euo pipefail

#### Variables
SCRIPT_DIR=$(readlink -f ${BASH_SOURCE[0]})
WRK_DIR=$(dirname "$SCRIPT_DIR")
dotdir=$WRK_DIR
old_dotdir=~/dotfiles_old

# list of files and dirs to backup/replace
files=$(cat "$dotdir/dotfiles.txt")

#### Script start

# create dotfiles_old in homedir
echo "Creating $old_dotdir for backup of any existing dotfiles in ~"
mkdir -p $old_dotdir

# move any existing dotfiles in homedir to dotfiles_old directory, then copy new ones
for f in $files; do
    echo "Moving any existing dotfile $f from ~ to $old_dotdir"
    if [ -e ~/."$f" ]; then
        mv ~/."$f" "$old_dotdir"
    fi

    echo "Creating new $f in ~ directory."
    if [ -d "$dotdir/$f" ]; then
        cp -r "$dotdir/$f" ~/."$f"
    else
        cp "$dotdir/$f" ~/."$f"
    fi
done

