# Dotfiles
Configuration for my linux/osx workstation

## Installation
### Git
local gitconfig is in `.gitconfig_local` <br/>
`ln -s ~/dotfiles/gitconfig_global ~/.gitconfig`

### Bashrc
remove .bashrc and
`ln -s ~/dotfiles/.bashrc ~/.bashrc`<br/>
or append `. ~/dotfiles/.bashrc` to .bashrc

### .initrc
maps *ctrl-y* to windows-style autocomplete <br/>
`ln -s ~/dotfiles/.inputrc ~/.inputrc`<br/>

### TMUX
`ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf`

### NEOVIM
install latest neovim from https://github.com/neovim/neovim/blob/master/INSTALL.md#appimage-universal-linux-package<br/>
or add neovim-ppa to apt repos `sudo add-apt-repository ppa:neovim-ppa/unstable -y`<br/>
```bash
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim/ ~/.config/nvim
```
local config in `/nvim_init_local.lua`
#### INSTALL vim-plug
see https://github.com/junegunn/vim-plug<br/>
`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`<br/>
### lf
https://github.com/gokcehan/lf<br/>  
```
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/lfrc ~/.config/lf/lfrc
```
### GDB
https://github.com/gdbinit/Gdbinit/tree/master
```
ln -s ~/dotfiles/.gdbinit ~/.gdbinit
```
### .pythonrc
```
ln -s ~/dotfiles/.pythonrc ~/.pythonrc
```
### XFCE

