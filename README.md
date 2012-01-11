# My .vim setup

## Installation:

    git clone git://github.com/benichu/dotvim.git ~/.vim

## Requirements:

* git (ex: ubuntu `apt-get install git-core`)
* vim (ex: ubuntu `apt-get install vim-nox`)
* curl
* backup existing `~/.vim` directory

## Create directories and symlinks:

    ln -s ~/.vim/.vimrc ~/.vimrc
    ln -s ~/.vim/.gvimrc ~/.gvimrc
    mkdir ~/.vim/tmp

## Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

## Exuberant ctags

    install http://ctags.sf.net
    ex: ubuntu `sudo apt-get install exuberant-ctags`
    ex: macos `brew install ctags && sudo mv /usr/bin/ctags /usr/bin/ctags.bak`

## Sudo user @ ubuntu

    sudo ln -s ~/.vim /root/.vim
    sudo ln -s ~/.vimrc /root/.vimrc

## How to add a bundle as a submodule

    cd ~/.vim
    mkdir ~/.vim/bundle
    git submodule add http://github.com/user_name/repo_name.git bundle/repo_name
    git add .
    git commit -m "Install repo_name bundle as a submodule."
