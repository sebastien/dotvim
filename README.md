# My .vim setup

## Installation:

    git clone git://github.com/benichu/dotvim.git ~/.vim

## Create dircetories and symlinks:

    ln -s ~/.vim/.vimrc ~/.vimrc
    ln -s ~/.vim/.gvimrc ~/.gvimrc
    mkdir ~/.vim/tmp

## Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update

## Recompile Command-T Ruby C extension for your platform (if other than Mac OS X):

    cd ~/.vim/bundle/command-t/ruby/command-t/
    ruby extconf.rb
    make clean; make

## Exuberant ctags

    install from: http://ctags.sf.net

## How to add a bundle as a submodule

    cd ~/.vim
    mkdir ~/.vim/bundle
    git submodule add http://github.com/user_name/repo_name.git bundle/repo_name
    git add .
    git commit -m "Install repo_name bundle as a submodule."
