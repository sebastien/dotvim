# My .vim setup

## Installation:

    git clone git://github.com/benichu/dotvim.git ~/.vim

## Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

## Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

## How to add a bundle as a submodule

    cd ~/.vim
    mkdir ~/.vim/bundle
    git submodule add http://github.com/user_name/repo_name.git bundle/repo_name
    git add .
    git commit -m "Install repo_name bundle as a submodule."
