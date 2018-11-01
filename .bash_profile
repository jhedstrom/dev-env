if [ -f "$HOME/.drush/drush.bashrc" ]; then
  source $HOME/.drush/drush.bashrc
fi

if [ -f "$HOME/.drush/drush.prompt.sh" ]; then
  source $HOME/.drush/drush.prompt.sh
fi

source $HOME/.bashrc

export GPG_TTY=$(tty)
