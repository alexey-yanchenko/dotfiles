# Install
* Run
```
curl -Lks http://bit.do/install-dotfiles | /bin/bash
```

* Clone [Vundle](https://github.com/VundleVim/Vundle.vim)

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

* Run Vim with command

```
vim +BundleInstall
```
# Manage
* Add new
```
config add <file_name>
config commit -m "Add <file_name>"
config push
```
