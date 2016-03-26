#!/usr/bin/sh

CLONE_DIR="~/.config/dotfiles"
DEIN_DIR="~/.vim/dein"
NVIM_DIR="~/.config/nvim"

# dotfiles
echo "dotfiles install..."
if ! [ -e "$CLONE_DIR" ]; then
  mkdir -p "$CLONE_DIR"
  git clone "https://github.com/nullpos/dotfiles.git" "$CLONE_DIR"
else
  cd "$CLONE_DIR"
  git pull origin master --rebase
fi

ln -s "$CLONE_DIR/dein/config/init.vim" "$NVIM_DIR/init.vim"
ln -s "$CLONE_DIR/dein" "$DEIN_DIR"
ln -s "$CLONE_DIR/dein/config/init.vim" "~/.vimrc"
# ln -s "$CLONE_DIR/.vimrc" "~/.vimrc"
ln -s "$CLONE_DIR/.zshrc" "~/.zshrc"

# fzf
echo "fzf install..."
FZF_DIR="~/.fzf"
if ! [ -e "$FZF_DIR" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_DIR"
else
  cd "$FZF_DIR"
  git pull origin master --rebase
fi
"$FZF_DIR/install"

# zplug
echo "zplug install..."
ZPLUG_DIR="~/.zplug"
if ! [ -e "$ZPLUG_DIR" ]; then
  git clone https://github.com/b4b4r07/zplug "$ZPLUG_DIR"
else
  zplug update --self
  zplug update
fi


