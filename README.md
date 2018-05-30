Tweaking Ubuntu for programming
===============================
These are the steps required to tweak Ubuntu for making a better programming environment. Assuming that you have already install `git`.
##Setting up zsh
Install zsh
-----------
zsh is a shell designed for interactive use. It can be used as an alternative of default `bash`. 
```bash
sudo apt-get install zsh curl
```
After installation, you could make `/usr/bin/zsh` as your default shell of terminal (make changes in the profile of your terminal)
Oh-my-zsh
---------
`oh-my-zsh` is an open source, community-driven framework for managing your ZSH configuration. Thanks to robbyrussel for maintaining the repository
```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
 To install custom plugins for ZSH
```bash
cd ~/.oh-my-zsh/ 
git submodule update --init
```
I have included a copy of my `zshrc` in this repo. You can copy it into your home folder
```zsh
cp zshrc ~/.zshrc
```
I have made litte changes in `arvindsrajtheme.zsh`, if you don't like the default one, you could use my modified one:
```zsh
cp arvindsraj.zsh-theme ~/.oh-my-zsh/themes/   
```
You can choose a theme from `~/.oh-my-zsh/themes` and update in the `~/.zshrc` 
##Setting up vim
Install vim
-----------
```zsh
sudo apt-get install vim python-autopep8 python-pip
sudo pip install yapf
sudo pip install futures
sudo pip install mccabe
sudo pip install frosted
```
Setting up Neobundle
--------------------
NeoBundle is a Vim plugin manager.
```zsh
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```
Copy the `vimrc` file from this repo to home folder.
```zsh
cp vimrc ~/.vimrc
```
open `vim` and type `y` to install the plugins mentioned in the `vimrc`.
Install YouCompleteMe 
---------------------
An autocompleter for vim. Lets compile it. You may have to install a dependency `cmake`,
```zsh
sudo apt-get install cmake build-essential python-dev python3-dev vim-nox
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
```
Copy `ycm_extra_conf.py` to your home folder to enable autocompleter.
```zsh
cp ycm_extra_conf.py ~/.ycm_extra_conf.py
```
##Setting up gdb
`gdb` is a poweful disassembling tool in GNU/Linux. Copy `gdbinit` file to your home folder 
```zsh
cp gdbinit ~/.gdbinit
```
##Setting up pythonrc
Copy `pythonrc` file to your home directory not to display all the unwanted welcome messages
upon opening a `python` interactive shell. 
```zsh
cp pythonrc ~/.pythonrc 
```
##Tweaking git 
`Legit` is a complementary command-line interface for Git, optimized for workflow simplicity. It is heavily inspired by GitHub for Mac.
You can read more about legit [here](http://www.git-legit.org/)
```zsh
sudo -H pip install legit
legit --install
```
