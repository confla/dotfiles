# dotfiles
Core sections of my dotfiles

1) Clone repository into $HOME directory

2) .cshrc, .bashrc, .tmux.conf, .vimrc
These configurations can be added to a new machine by adding "source ~/dotfiles/\<filename\>" to ~/\<filename\>

3) .gitconfig
This configuration can be added to a new machine by adding the lines below to ~/.gitconfig:
[include]
    path = ~/dotfiles/.gitconfig
