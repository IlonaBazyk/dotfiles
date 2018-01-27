#!/bin/bash

# Installs Homebrew and some of the common dependencies needed/desired for software development

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

# Install the Homebrew packages I use on a day-to-day basis.
#
# - Fuck (https://github.com/nvbn/thefuck): Correct your previous command. Note
#   that this needs to be added to zsh or bash. See the project README.
#
# - tldr (https://github.com/tldr-pages/tldr): A collection of simplified and
#   community-driven man pages.
#
# - tree (http://mama.indstate.edu/users/ice/tree/): Tree is a recursive directory
#   listing command that produces a depth indented listing of files, which is
#   colorized ala dircolors if the LS_COLORS environment variable is set and
#   output is to tty.
#
# - ack (https://beyondgrep.com): ack is a tool like grep, optimized for programmers
#
# - diff-so-fancy (https://github.com/so-fancy/diff-so-fancy): diff-so-fancy strives
#   to make your diff's human readable instead of machine readable. This helps
#   improve code quality and help you spot defects faster.
#
# - wifi-password (https://github.com/rauchg/wifi-password): People ask you for the
#   Wi-Fi password. Answer quickly.

apps=(
    thefuck
    tldr
    tree
    ack
    diff-so-fancy
    wifi-password
    neovim
    tmux
)

for item in ${apps[*]}
do
    brew install $item
done

# Remove outdated versions from the cellar
brew cleanup
