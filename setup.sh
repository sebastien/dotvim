DOTVIM_HOME=`pwd`
test "! -f ~/.vim"     && ln -s $DOTVIM_HOME/        ~/.vim    ; true
test "! -f ~/.vimrc"   && ln -s $DOTVIM_HOME/.vimrc  ~/.vimrc  ; true
test "! -f ~/.vimrc"   && ln -s $DOTVIM_HOME/.gvimrc ~/.gvimrc ; true
test "! -d ~/.vim/tmp" && mkdir ~/.vim/tmp                     ; true
cd ~/.vim
git submodule init
git submodule update
cd $DOTVIM_HOME
# EOF
