#!/usr/bin/sh

CLONE_DIR="$HOME/.config/dotfiles"
DEIN_DIR="$HOME/.vim/dein"
NVIM_DIR="$HOME/.config/nvim"
VIMRC="$HOME/.vimrc"
ZSHRC="$HOME/.zshrc"

# dotfiles
echo "dotfiles install..."
if ! [ -e "$CLONE_DIR" ]; then
  mkdir -p "$CLONE_DIR"
  git clone "https://github.com/nullpos/dotfiles.git" "$CLONE_DIR"
else
  cd "$CLONE_DIR"
  git pull origin master --rebase
fi

ln -s "$CLONE_DIR/dein" "$DEIN_DIR"
if [ -e "$NVIM_DIR" ]; then
  ln -s "$CLONE_DIR/dein/config/init.vim" "$NVIM_DIR/init.vim"
fi

if [ -e "$VIMRC" ]; then
  mv "$VIMRC" "$VIMRC.old"
fi
ln -s "$CLONE_DIR/dein/config/init.vim" "$HOME/.vimrc"
# ln -s "$CLONE_DIR/.vimrc" "$HOME/.vimrc"

if [ -e "$ZSHRC" ]; then
  mv "$ZSHRC" "$ZSHRC.old"
fi
ln -s "$CLONE_DIR/.zshrc" "$HOME/.zshrc"

# fzf
echo "fzf install..."
FZF_DIR="$HOME/.fzf"
if ! [ -e "$FZF_DIR" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_DIR"
else
  cd "$FZF_DIR"
  git pull origin master --rebase
fi
"$FZF_DIR/install"

# zplug
echo "zplug install..."
ZPLUG_DIR="$HOME/.zplug"
if ! [ -e "$ZPLUG_DIR" ]; then
  git clone https://github.com/b4b4r07/zplug "$ZPLUG_DIR"
else
  zplug update --self
  zplug update
fi


