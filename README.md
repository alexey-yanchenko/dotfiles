# Install
* Run
```
curl -Lks https://raw.githubusercontent.com/alexey-yanchenko/dotfiles/refs/heads/master/.bin/install.sh | /bin/bash
```

* Clone [Vundle](https://github.com/VundleVim/Vundle.vim)

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

* Run Vim with command

```
vim +BundleInstall
```
### Requirements
- Packages
```
ripgrep fd-find cmake nvim yazi
```
- [Nerd Font](https://www.nerdfonts.com/) (v3.0 or greater) (optional, but needed to display some icons)

# Manage
* Add new
```
config add <file_name>
config commit -m "Add <file_name>"
config push
```
