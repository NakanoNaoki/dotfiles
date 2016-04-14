# Install :rocket:
```sh
$ ssh-keygen -t rsa -C "seiya3628@gmail.com"
$ ssh -T git@github.com
$ cd ~/dotfiles
$ git clone
$ ./dotfiles.sh
$ vimr
```

# It requires Vim 7.3.885 or above and "if_lua" enabled Vim.
## For Mac OS X Version 10.11
```
$ vim --version | grep lua
$ brew uninstall vim
$ brew update
$ brew options vim | grep lua
$ brew install vim --with-lua
```
