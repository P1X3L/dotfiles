#!/bin/bash

# Go to your home directory
cd ~

# Backup your existing vim, zsh and tmux configs if they already exist
files="
  .vim
  .zshrc
  .vimrc
  .tmux.conf
"
for f in $files
do
  if [[ -f $f || -d $f ]]
  then
    mv $f "$f".old
    echo "$f moved to $f.old"
  else
    echo "$f does not exist"
  fi
done

# Check if you have brew installed and install vim, tmux, python (for powerline),
# reattach-to-user-namespace (for tmux), z and ag (the_silver_searcher for vim's ctrlp plugin)
if type "brew" > /dev/null
then
  brew update
  brew install vim --override-system-vi tmux python reattach-to-user-namespace z ag
  pip install psutil
  pip install powerline-status
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check that you have robby russell's excellent oh-my-zsh
if [ $(echo $ZSH) != $(echo $HOME/.oh-my-zsh) ]
then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Hide dotfiles folder if it has not been made correctly from installation step 1
if [[ -d "dotfiles" ]]
then
  mv dotfiles .dotfiles
fi

# Create symlinks for your new configuration
ln -s .dotfiles/tmux.conf .tmux.conf &&
ln -s .dotfiles/vimrc .vimrc &&
ln -s .dotfiles/vim .vim &&
ln -s .dotfiles/zshrc .zshrc
