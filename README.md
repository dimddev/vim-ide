### A Python, Rust, C++ and HTML5 VIM IDE

1. First we need to install Vundle:

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

2. Next clone or get .vimrc

    wget https://raw.githubusercontent.com/dimddev/vim-ide/master/.vimrc ~

The above command will download `.vimrc` in your home directory.

3. Install all plugins and transform your vim to IDE.

First open `vim` and type `:PluginInstall`. This will install all required plugins.

The `YouCompleteMe` plugin require `cmake` and probably manual installation as well.
If that the case:

    cd ~/.vim/bundle/YouCompleteMe
    sudo ./install.py  # this require cmake!

After this steps `YouCompleteMe` should works as well.

So that's it, now your vim was transformed into nice IDE. You could inspect `.vimrc`,
for what plugins are installed and you can get more information about them from the
official web sites.
