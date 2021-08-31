#!/bin/bash

dir=~/dotfiles
olddir=~/dotfiles-backup
files="vimrc zshrc gitconfig gitignore_global"

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  if [ -L ~/.$file ]; then
    rm ~/.$file
  else
    mv ~/.$file $olddir/
  fi

  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

if [ $SPIN ]; then
  sudo apt-get install -y wget
fi

echo "Installing oh-my-zsh!"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
echo "...done"

echo "Cloning Vundle.vim"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "...done"

echo "Installing vim plugins"
vim +PluginInstall +qall
echo "...done"

