#!/usr/bin/env bash

set -e
set -x

sudo -v

# sudo add-apt-repository -y ppa:git-core/ppa
# sudo apt install -y zsh git stow curl

PROGRAMS=(git zsh starship)

for program in ${PROGRAMS[@]}; do
  stow -v --target=$HOME $program
done

touch ~/.custom.sh

echo "Done!"
