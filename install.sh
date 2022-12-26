#!/bin/bash

[ -f "$HOME/.vimrc" ] && cp "$HOME"/.vimrc{,.bak}
[ -f "$HOME/.config/nvim/init.vim" ] && cp "$HOME"/.config/nvim/init.vim{,.bak}

curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

pro_dir="$(cd "$(dirname "$0")" && pwd)"
ln -fs "${pro_dir}/init.vim" "$HOME/.config/nvim/init.vim"
ln -fs "${pro_dir}/.vimrc" "$HOME/.vimrc"
