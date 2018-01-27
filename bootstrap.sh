#!/usr/bin/env bash

echo "Starting bootstrapping"

# Warn user this script will overwrite current dotfiles
while true; do
  read -p "Warning: this will overwrite your current dotfiles. Continue? [y/n] " yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
  esac
done

# Get the dotfiles directory's absolute path
DOTFILES_DIR="$(cd "$(dirname "$0")"; pwd -P)"

# Create directories if they don't exist
create_dir() {
  if [[ ! -e $1 ]]; then
      mkdir $1
      echo "${1} directory created"
  elif [[ ! -d $1 ]]; then
      echo "${1} already exists but is not a directory"
  fi
}

create_dir $HOME/.vim
create_dir $HOME/.vim/autoload
create_dir $HOME/.vim/backup
create_dir $HOME/.vim/swp
create_dir $HOME/.vim/undo
create_dir $HOME/.tmux
create_dir $HOME/.config

# Install Oh My Zsh open source, community-driven framework for
# managing your zsh configuration
sh $DOTFILES_DIR/install/zsh.sh

# Install Brew The missing package manager for macOS
sh $DOTFILES_DIR/install/brew.sh

# Install Homebrew-Cask extends Homebrew and brings its elegance,
# simplicity, and speed to macOS applications and large binaries alike
sh $DOTFILES_DIR/install/brew-cask.sh

# Install Node Version Manager - Simple bash script to manage multiple
# active node.js versions
sh $DOTFILES_DIR/install/nvm.sh

# Symlink and report creation of link
create_symlink() {
  ln -sfn $1 $2
  echo "Symlinked ${1} -> ${2}"
}

# All the symlinks
# Git
create_symlink $DOTFILES_DIR/git/.gitconfig $HOME/.gitconfig
create_symlink  $DOTFILES_DIR/git/.gitignore_global $HOME/.gitignore_global

# Vim
create_symlink $DOTFILES_DIR/lib/vim-plug/plug.vim $HOME/.vim/autoload/plug.vim
create_symlink $DOTFILES_DIR/vim/.vimrc $HOME/.vimrc

# Neovim
create_symlink $HOME/.vim $HOME/.config/nvim
create_symlink $HOME/.vimrc $HOME/.config/nvim/init.vim

# Zsh
create_symlink $DOTFILES_DIR/zsh/.zshrc $HOME/.zshrc

# Set macOS defaults
# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Bootstrapping complete"

