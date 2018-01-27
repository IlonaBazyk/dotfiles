#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# This script configures my Node.js development setup. Note that
# nvm is installed by the Homebrew install script.

# All `npm install <pkg>` commands will pin to the version that was available at the time you run the command
npm config set save-exact = true

# Globally install with npm
# To list globally installed npm packages and version: npm list -g --depth=0
#
# - serve (https://github.com/zeit/serve): Static file serving and directory listing
#
# - how2 (https://github.com/santinic/how2): stackoverflow from the terminal
#

packages=(
    serve
    how2
    gulp
    eslint
    stylelint
)

for item in ${packages[*]}
do
    npm install -g $item
done
