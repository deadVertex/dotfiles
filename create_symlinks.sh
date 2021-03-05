#!/bin/bash -e

# Get the absolute path to the directory this script resides in
DOT_FILE_DIR=$(dirname "$0")
DOT_FILE_DIR=$(realpath "$DOT_FILE_DIR")

function create_or_replace_symlink() {
	CONFIG_FILE_PATH=$1
	SYMLINK_PATH=$2

    # Test if the file exists and is a symlink
	if [ -L "$SYMLINK_PATH" ]; then
		rm "$SYMLINK_PATH"
	fi
	ln -s "$CONFIG_FILE_PATH" "$SYMLINK_PATH"
}

# NEOVIM
create_or_replace_symlink \
    "$DOT_FILE_DIR/neovim/init.vim" \
    "$HOME/.config/nvim/init.vim"

# ZSH
create_or_replace_symlink \
    "$DOT_FILE_DIR/zsh/zshrc" \
    "$HOME/.zshrc"

# ln -s "$DOT_FILE_DIR/zsh/zshrc" "$HOME/.zshrc"
# ln -s "$DOT_FILE_DIR/tmux/config" "$HOME/.tmux.conf"

echo "Symlinks to dot files created/updated for neovim and ZSH"
