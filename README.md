# Dotfiles
Configuration for my linux/osx workstation

## Installation
### Git
local gitconfig is in .gitconfig_local <br/>
`ln -s ~/dotfiles/gitconfig_global ~/.gitconfig`

### Bashrc
remove .bashrc and
`ln -s ~/dotfiles/.bashrc ~/.bashrc`<br/>
or append `. ~/dotfiles/.bashrc` to .bashrc

### .initrc
maps *ctrl-y* to windows-style autocomplete <br/>
`ln -s ~/dotfiles/.initrc ~/.initrc`<br/>

### TMUX
`ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf`

### NEOVIM
install latest neovim from https://github.com/neovim/neovim/blob/master/INSTALL.md#appimage-universal-linux-package<br/>
or add neovim-ppa to apt repos `sudo add-apt-repository ppa:neovim-ppa/unstable -y`<br/>
```bash
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim/ ~/.config/nvim
```
local config in `~/.vimrc_local` and `~/.vimrc_local_plugins`
#### INSTALL vim-plug
see https://github.com/junegunn/vim-plug<br/>
`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`<br/>
### lf
https://github.com/gokcehan/lf<br/>  
`ln -s ~/dotfiles/lfrc ~/.config/lf/lfrc`

### glow
markdown viewer https://github.com/charmbracelet/glow<br/>
```
# wget https://github.com/charmbracelet/glow/releases/ whatever _x86.64.tar.gz
# unpack, copy executable to bin
# enable bash completion
sudo cp completions/glow.bash /usr/share/bash-completion/completions/glow
```

### cheat.sh
https://github.com/chubin/cheat.sh<br/>
somewhre in your PATH put<br/>
```
curl https://cht.sh/:cht.sh -o cht
chmod u+x cht
```
