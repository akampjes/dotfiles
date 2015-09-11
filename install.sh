#!/bin/bash

cd files
FILESDIR="$(pwd)"

# Link all the files back to here
for file in *; do
  [[ -e $file ]] || continue
  echo "$HOME/.$file -> $FILESDIR/$file "
  ln -sf "$FILESDIR/$file" "$HOME/.$file"
done
