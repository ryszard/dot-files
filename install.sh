#!/bin/bash
set -ex
target=${target:-$HOME}
cd config
for file in *; do
  cp -R $file $target/.$file
done
