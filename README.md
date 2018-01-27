### Eugene Dzhevadov's Dotfiles
---

![Screenshot of my shell prompt](https://monosnap.com/file/krXhr7ziWOM977ctdf10Yt5qtsWzXH.png)

This repo for tracking dotfiles that I use for personalize my OS X including tools and software which I use daily. They should be cloned to the home directory and then a setup script creates symlinks from the home directory to the files which are located in `~/dotfiles/.` and install the software.

**Note** I prefer to use the iTerm port of [Oceanic Next Theme](https://github.com/voronianski/oceanic-next-theme/) as a default terminal theme.

### Features
---
 - Git aliases
 - Vim & Neovim config
 - Brew & Brew Cask apps
 - Node Version Manager
 - NPM packages 
 - OS X defaults
 - Install scripts

### Install
---
**Warning:** If you want to give these dotfiles a try, you should first fork or clone this repo then review the code, and remove things you don’t want or need.

In general, the installation is required **Xcode Command Line Tools**. Is a large suite of software development tools and libraries from Apple. The Xcode Command Line Tools are part of XCode. Installation of many common Unix-based tools requires the GCC compiler. The Xcode Command Line Tools include a GCC compiler.

```bash
$ xcode-select --install
```

When installation of the Xcode is completed run a setup script.

```bash
sh ~/dotfiles/boostrap.sh
```

Final steps is installation of **Node.js** and  **npm packages** which are usually used day-to-day basis.

```bash
$ nvm install node
```

```bash
sh ~/dotfiles/install/npm.sh
```

## Thanks to…
---
- [GitHub ❤ ~/](http://dotfiles.github.com/)
- @ptb and [his _macOS Setup_ repository](https://github.com/ptb/mac-setup)

### License
---
The code is available under the MIT license.
