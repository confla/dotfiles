dotfiles
========
Core sections of my dotfiles

Instructions
------------

1) Clone repository into `$HOME` directory
2) _.cshrc, .bashrc, .tmux.conf, .vimrc_
    These configurations can be added to a new machine by adding:
    ```bash
    source ~/dotfiles/<filename>
    ```
    to `~/<filename>`
3) _.gitconfig_
    This configuration can be added to a new machine by adding the lines below
    to ~/.gitconfig:
    ```git
    [include]
        path = ~/dotfiles/.gitconfig
    ```
