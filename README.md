# Dotfiles
Configuration for my linux/osx workstation

## Installation
### Git
`ln -s ~/dotfiles/gitconfig_global ~/.gitconfig`
local gitconfig is in .gitconfig_local
### Bashrc
remove .bashrc and
`ln -s ~/dotfiles/.bashrc ~/.bashrc`<br/>
or append `. ~/dotfiles/.bashrc` to .bashrc
### .initrc
maps *ctrl-y* to windows-style autocomplete <br/>
`ln -s ~/dotfiles/.initrc ~/.initrc`<br/>
### TMUX
`ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf`
### VIM
`ln -s ~/dotfiles/.vim ~/.vim`<br/>
`ln -s ~/dotfiles/.vimrc ~/.vimrc`<br/>
### NEOVIM
install latest neovim from https://github.com/neovim/neovim/blob/master/INSTALL.md#appimage-universal-linux-package<br/>
or add neovim-ppa to apt repos `sudo add-apt-repository ppa:neovim-ppa/unstable -y`<br/>
```bash
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim/ ~/.config/nvim
```
local config in `~/.vimrc_local` and `~/.vimrc_local_plugins`
#### INSTALL vim-plug
see https://github.com/junegunn/vim-plug
`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`<br/>
### lf
https://github.com/gokcehan/lf  
`ln -s ~/dotfiles/lfrc ~/.config/lf/lfrc`

