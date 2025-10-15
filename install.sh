#!/bin/bash

function install() {
    src="$1"
    dst="$2"
    # [ -f "$dst" ] && { echo "backup $dst"; mv "$dst"{,.bak}; }
    echo "link $src -> $dst"
    ln -fsn "$src" "$dst"
}

pro_dir="$(cd "$(dirname "$0")" && pwd)"
vim_rc_dir="$HOME/.vim"
nv_rc_dir="$HOME/.config/nvim"
coc_dir="$HOME/.config/coc"
mkdir -p "${nv_rc_dir}" "${vim_rc_dir}" "${coc_dir}"

install "${pro_dir}/vim.d" "$HOME/.vim.d"

install "${pro_dir}/init.vim" "$HOME/.vimrc"
install "${pro_dir}/coc-settings.json" "${vim_rc_dir}/coc-settings.json"
install "${pro_dir}/syntax" "${vim_rc_dir}/syntax"
install "${pro_dir}/filetype.vim" "${vim_rc_dir}/filetype.vim"

install "${pro_dir}/init.vim" "${nv_rc_dir}/init.vim"
install "${pro_dir}/lua" "${nv_rc_dir}/lua"
install "${pro_dir}/coc-settings.json" "${nv_rc_dir}/coc-settings.json"
install "${pro_dir}/syntax" "${nv_rc_dir}/syntax"
install "${pro_dir}/filetype.vim" "${nv_rc_dir}/filetype.vim"

install "${pro_dir}/ultisnips" "${coc_dir}/ultisnips"

echo "vim-plug install for vim & nvim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "GitHub Copilot plugin install for vim & nvim"
git clone https://github.com/github/copilot.vim.git "$vim_rc_dir"/pack/github/start/copilot.vim
git clone https://github.com/github/copilot.vim.git "$nv_rc_dir"/pack/github/start/copilot.vim 

echo "please add this to .tmux.conf:"
sed 's/^/\t/g' "${pro_dir}/tmux.conf"
