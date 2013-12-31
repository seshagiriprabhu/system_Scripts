Tweaking Ubuntu for programming
===============================
These are the steps required to tweak Ubuntu for making a better programming environment

##Setting up zsh

Install zsh
-----------
Zsh is a shell designed for interactive use. It can be used as an alternative of default `bash`. 
```zsh
➜  sudo apt-get install zsh
```

Oh-my-zsh
---------

`oh-my-zsh` is an open source, community-driven framework for managing your ZSH configuration.

 ```zsh
 ➜ curl -L https://raw.github.com/arvindsraj/oh-my-zsh/master/tools/install.sh | sh
 ```
 
 To install custom plugins for ZSH
```zsh
➜  git submodule init --update
```

I have included a copy of my `zshrc` in this repo. You can copy it into your home folder
```zsh
➜  cp zshrc ~/.zshrc
```

With this `zshrc`, you could create gitignore files like this in your repository.
```zsh
➜ gi linux,python >> .gitignore

```
You can choose a theme from `~/.oh-my-zsh/themes` and update in the `~/.zshrc` 

##Setting up vim

Install vim
-----------

Lets install the latest version of vim 

```zsh
➜  sudo add-apt-repository ppa:fcwu-tw/ppa
➜  sudo apt-get update
➜  sudo apt-get install vim
```

Copy the `vimrc` file from this repo to home folder
```zsh
➜  cp vimrc ~/.vimrc
```
open `vim` and type `(y)` to install the plugins mentioned in the `vimrc`.

Setup Neobundle
---------------

```zsh
➜  mkdir -p ~/.vim/bundle
➜  cd ~/.vim/bundle
➜  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

Install YouCompleteMe 
---------------------
Its an autocompleter for vim

Compiling YCM with semantic support for C-family languages:
```zsh
➜  cd ~/.vim/bundle/YouCompleteMe
➜  ./install.sh --clang-completer
```
copy ycm__extra__conf.py to your home folder to enable autocompleter.
```zsh
➜  cp ycm__extra__conf.py ~/.ycm__extra__conf.py
```

##Setting up gdb
Copy gdbinit file to your home folder 
```zsh
➜  cp gdbinit ~/.gdbinit
```

##Setting up pythonrc
Copy pythonrc file to your home directory
```zsh
➜  cp pythonrc ~/.pythonrc 
```

##Tweaking git 
Legit is a complementary command-line interface for Git, optimized for workflow simplicity. It is heavily inspired by GitHub for Mac.

Install legit
-------------
Assuming you have already install git. You can read more about legit [here](http://www.git-legit.org/)
```zsh
➜  sudo apt-get install python-pip 
➜  pip install legit
```
