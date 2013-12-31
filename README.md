Tweaking Ubuntu for programming
===============================
These are the steps required to tweak Ubuntu for making a better programming environment. Assuming that you have already install `git`.
##Setting up zsh
Install zsh
-----------
zsh is a shell designed for interactive use. It can be used as an alternative of default `bash`. 
```bash
$  sudo apt-get install zsh
```
After installation, you could make `/usr/bin/zsh` as your default shell of terminal (make changes in the profile of your terminal)
Oh-my-zsh
---------
`oh-my-zsh` is an open source, community-driven framework for managing your ZSH configuration. Thanks to [Arvind](https://twitter.com/arvindsraj) for creating a custom zsh theme.
```bash
 $ curl -L https://raw.github.com/arvindsraj/oh-my-zsh/master/tools/install.sh | sh
```
 To install custom plugins for ZSH
```bash
➜  git submodule update --init
```
I have included a copy of my `zshrc` in this repo. You can copy it into your home folder
```zsh
➜  cp zshrc ~/.zshrc
```
I have made litte changes in arvindsrajtheme.zsh, if you don't like the default one, you could use my modified one:
```zsh
➜  cp arvindsraj.zsh-theme ~/.oh-my-zsh/themes/   
```
With this `zshrc`, you could create gitignore files like this in your repository.
```zsh
➜ gi linux,python >> .gitignore
```
You can choose a theme from `~/.oh-my-zsh/themes` and update in the `~/.zshrc` 
##Setting up vim
Install vim
-----------
Lets install the latest version of `vim`.
```zsh
➜  sudo add-apt-repository ppa:fcwu-tw/ppa
➜  sudo apt-get update
➜  sudo apt-get install vim
```
Setting up Neobundle
--------------------
NeoBundle is a Vim plugin manager.
```zsh
➜  mkdir -p ~/.vim/bundle
➜  cd ~/.vim/bundle
➜  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```
Copy the `vimrc` file from this repo to home folder.
```zsh
➜  cp vimrc ~/.vimrc
```
open `vim` and type `y` to install the plugins mentioned in the `vimrc`.
Install YouCompleteMe 
---------------------
An autocompleter for vim. Lets compile it.
```zsh
➜  cd ~/.vim/bundle/YouCompleteMe
➜  ./install.sh --clang-completer
```
Copy `ycm__extra__conf.py` to your home folder to enable autocompleter.
```zsh
➜  cp ycm__extra__conf.py ~/.ycm__extra__conf.py
```
##Setting up gdb
`gdb` is a poweful disassembling tool in GNU/Linux. Copy `gdbinit` file to your home folder 
```zsh
➜  cp gdbinit ~/.gdbinit
```
##Setting up pythonrc
Copy `pythonrc` file to your home directory not to display all the unwanted welcome messages
upon opening a `python` interactive shell. 
```zsh
➜  cp pythonrc ~/.pythonrc 
```
##Tweaking git 
`Legit` is a complementary command-line interface for Git, optimized for workflow simplicity. It is heavily inspired by GitHub for Mac.
You can read more about legit [here](http://www.git-legit.org/)
```zsh
➜  sudo apt-get install python-pip 
➜  pip install legit
```
