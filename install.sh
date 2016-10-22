#!/bin/bash
set -ex
target=${target:-$HOME}
cd config
for file in *; do
  if [[ ! -e $target/.$file ]]; then
	  ln -sf "$(pwd)/$file" $target/.$file
  fi
done
