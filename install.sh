#!/usr/bin/env bash

set -e
set -x

sudo -v

# sudo add-apt-repository -y ppa:git-core/ppa
# sudo apt install -y zsh git stow curl

# OH_MY_ZSH_DIR=$HOME/.oh-my-zsh

# if [ ! -d $OH_MY_ZSH_DIR ]; then
#     sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# fi

# ZSH_SUGGESTIONS_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# if [ ! -d $ZSH_SUGGESTIONS_DIR ]; then
#     git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_SUGGESTIONS_DIR
# fi

OLD_DOTFILES="$HOME/dotfiles_bk_$(date -u +"%Y%m%d%H%M%S")"
mkdir $OLD_DOTFILES

function backup_if_exists() {
    if [ -f $1 ];
    then
      mv $1 $OLD_DOTFILES
    fi
    if [ -d $1 ];
    then
      mv $1 $OLD_DOTFILES
    fi
}

backup_if_exists ~/.zshrc
backup_if_exists ~/.gitconfig

PROGRAMS=(git zsh)

for program in ${PROGRAMS[@]}; do
    stow -v --target=$HOME $program
done

touch ~/.custom.sh

echo "Done!"
