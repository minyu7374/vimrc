#!/bin/bash

pro_dir="$(cd "$(dirname "$0")" && pwd)"
target="${1:-vim}"

install() {
    src="$1"
    dst="$2"
    # [ -f "$dst" ] && { echo "backup $dst"; mv "$dst"{,.bak}; }
    echo "link $src -> $dst"
    ln -fsn "$src" "$dst"
}

install_common() {
    coc_dir="$HOME/.config/coc"
    mkdir -p "${coc_dir}"

    install "${pro_dir}/vim.d" "$HOME/.vim.d"
    install "${pro_dir}/ultisnips" "${coc_dir}/ultisnips"
}

post_install() {
    echo "please add this to .tmux.conf:"
    sed 's/^/\t/g' "${pro_dir}/tmux.conf"
}

install_spec_vim() {
    vim_rc_dir="$HOME/.vim"
    mkdir -p "${vim_rc_dir}"

    install "${pro_dir}/init.vim" "$HOME/.vimrc"
    install "${pro_dir}/coc-settings.json" "${vim_rc_dir}/coc-settings.json"
    install "${pro_dir}/syntax" "${vim_rc_dir}/syntax"
    install "${pro_dir}/filetype.vim" "${vim_rc_dir}/filetype.vim"

    echo "vim-plug install for vim"
    curl -fLo "${vim_rc_dir}"/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "GitHub Copilot plugin install for vim"
    git clone https://github.com/github/copilot.vim.git "${vim_rc_dir}"/pack/github/start/copilot.vim
}

install_spec_nvim() {
    nv_rc_dir="$HOME/.config/nvim"
    mkdir -p "${nv_rc_dir}"

    install "${pro_dir}/init.vim" "${nv_rc_dir}/init.vim"
    install "${pro_dir}/lua" "${nv_rc_dir}/lua"
    install "${pro_dir}/coc-settings.json" "${nv_rc_dir}/coc-settings.json"
    install "${pro_dir}/syntax" "${nv_rc_dir}/syntax"
    install "${pro_dir}/filetype.vim" "${nv_rc_dir}/filetype.vim"

    echo "vim-plug install for nvim"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    echo "GitHub Copilot plugin install for nvim"
    git clone https://github.com/github/copilot.vim.git "${nv_rc_dir}"/pack/github/start/copilot.vim
}

case "$target" in
vim | vi) install_spec=install_spec_vim ;;
neovim | nvim | nv) install_spec=install_spec_nvim ;;
*)
    echo "target not support: '$target'"
    exit 1
    ;;
esac

install_common
$install_spec
post_install
