#!/bin/bash
set -ex
target=${target:-$HOME}
cd config
for file in *; do
  ln -sf "$(pwd)/$file" $target/.$file
done
