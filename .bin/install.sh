git clone --bare https://github.com/alexey-yanchenko/dotfiles.git $HOME/.cfg
function config {
   git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

echo "alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
echo "[[ -f ~/.ebash ]] && . ~/.ebash" >> $HOME/.bashrc
