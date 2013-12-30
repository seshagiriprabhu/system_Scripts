Tweaking Ubuntu for programming
===============================
These are the steps required to tweak Ubuntu for making a better programming environment

##Setting up zsh

Install zsh
-----------
```bash
$ sudo apt-get install zsh
```

Oh-my-zsh
---------

`oh-my-zsh` is an open source, community-driven framework for managing your ZSH configuration.

 ```bash
$  curl -L https://raw.github.com/arvindsraj/oh-my-zsh/master/tools/install.sh | sh
 ```
 
 To install custom plugins for ZSH
```bash
$ git submodule init --update
```

I have included a copy of my `zshrc` in this repo. You can copy it into your home folder
```bash
$ cp zshrc ~/.zshrc
```

You can choose a theme from `~/.oh-my-zsh/themes` and update in the `~/.zshrc` 

##Setting up vim

Install vim
-----------

Lets install the latest version of vim 

```bash
$ sudo add-apt-repository ppa:fcwu-tw/ppa
$ sudo apt-get update
$ sudo apt-get install vim
```

Copy the `vimrc` file from this repo to home folder
```bash
$ cp vimrc ~/.vimrc
```
open `vim` and type `(y)` to install the plugins mentioned in the `vimrc`.

Setup Neobundle
---------------

```bash
$ mkdir -p ~/.vim/bundle
$ cd ~/.vim/bundle
$ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

Install YouCompleteMe 
---------------------
Its an autocompleter for vim

Compiling YCM with semantic support for C-family languages:
```bash
$ cd ~/.vim/bundle/YouCompleteMe
$ ./install.sh --clang-completer
```
copy ycm__extra__conf.py to your home folder to enable autocompleter.
```bash
$ cp ycm__extra__conf.py ~/.ycm__extra__conf.py
```

##Setting up gdb
Copy gdbinit file to your home folder 
```bash
$ cp gdbinit ~/.gdbinit
```

##Setting up pythonrc
Copy pythonrc file to your home directory
```bash
$ cp pythonrc ~/.pythonrc 
```
