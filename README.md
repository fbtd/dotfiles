# Dotfiles
Configuration for my linux/osx workstation

## Installation
### Git
`ln -s ~/dotfiles/gitconfig_global ~/.gitconfig`
### Bashrc
remove .bashrc and
`ln -s ~/dotfiles/.bashrc ~/.bashrc`<br/>
or append `. ~/dotfiles/.bashrc` to .bashrc
### TMUX
`ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf`
### VIM
`ln -s ~/dotfiles/.vim ~/.vim`<br/>
`ln -s ~/dotfiles/.vimrc ~/.vimrc`
### NEOVIM
`ln -s ~/dotfiles/.vimrc ~/.config/nvim/init.vim`<br/>
`ln -s ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json`<br/>
`ln -s ~/dotfiles/.vim/colors/ ~/.config/nvim/colors`<br/>

#### INSTALL vim-plug
`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`<br/>
see https://github.com/junegunn/vim-plug
