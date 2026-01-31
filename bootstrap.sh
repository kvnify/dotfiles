#!/bin/bash

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
olddir=~/dotfiles-backup
files="vimrc zshrc gitconfig gitignore_global p10k.zsh"

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

if [ $SPIN ]; then
  echo "Installing oh-my-zsh!"
  sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
  echo "...done"

  echo "Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  echo "...done"

  echo "Installing vim-plug..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "...done"

  echo "Installing vim plugins with vim-plug..."
  vim +PlugInstall +qall
  echo "...done"
fi

for file in $files; do
  if [ -L ~/.$file ]; then
    rm ~/.$file
  else
    mv ~/.$file $olddir/ 2>/dev/null || true
  fi

  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

#===============================================================================
# Powerlevel10k Theme
#===============================================================================
p10k_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$p10k_dir" ]; then
  echo ""
  echo "Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10k_dir"
  echo "...done"
else
  echo ""
  echo "Powerlevel10k theme already installed"
fi

#===============================================================================
# Meslo Nerd Font (recommended for Powerlevel10k)
#===============================================================================
echo ""
echo "Checking for MesloLGS NF font..."

# Determine font directory based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  font_dir="$HOME/Library/Fonts"
else
  font_dir="$HOME/.local/share/fonts"
fi
mkdir -p "$font_dir"

# Download fonts if not already installed
font_base_url="https://github.com/romkatv/powerlevel10k-media/raw/master"
fonts=(
  "MesloLGS NF Regular.ttf"
  "MesloLGS NF Bold.ttf"
  "MesloLGS NF Italic.ttf"
  "MesloLGS NF Bold Italic.ttf"
)

fonts_installed=true
for font in "${fonts[@]}"; do
  if [ ! -f "$font_dir/$font" ]; then
    fonts_installed=false
    break
  fi
done

if [ "$fonts_installed" = false ]; then
  echo "Installing MesloLGS NF fonts..."
  for font in "${fonts[@]}"; do
    encoded_font=$(echo "$font" | sed 's/ /%20/g')
    curl -fLo "$font_dir/$font" "$font_base_url/$encoded_font"
  done
  echo "...done"
  echo "NOTE: Set your terminal font to 'MesloLGS NF' for proper icon rendering"
else
  echo "MesloLGS NF fonts already installed"
fi

#===============================================================================
# Claude Code Configuration
#===============================================================================
echo ""
echo "Setting up Claude Code configuration..."

# Create Claude Code config directory
claude_config_dir="$HOME/.claude"
mkdir -p "$claude_config_dir"

# Symlink Claude settings
if [ -f "$dir/claude/settings.json" ]; then
  if [ -L "$claude_config_dir/settings.json" ]; then
    rm "$claude_config_dir/settings.json"
  else
    mv "$claude_config_dir/settings.json" "$olddir/" 2>/dev/null || true
  fi
  ln -s "$dir/claude/settings.json" "$claude_config_dir/settings.json"
  echo "Linked Claude Code settings.json"
fi

# Copy CLAUDE.md to home directory for global project context
if [ -f "$dir/claude/CLAUDE.md" ]; then
  cp "$dir/claude/CLAUDE.md" "$HOME/CLAUDE.md"
  echo "Copied CLAUDE.md to home directory"
fi

echo "...Claude Code configuration done"

#===============================================================================
# Summary
#===============================================================================
echo ""
echo "=========================================="
echo "Dotfiles installation complete!"
echo "=========================================="
echo ""
echo "Installed configurations:"
echo "  - Zsh with Powerlevel10k theme"
echo "  - MesloLGS NF font for terminal icons"
echo "  - Vim with vim-plug and CoC.nvim"
echo "  - Git config with extended aliases"
echo "  - Claude Code settings"
echo ""
echo "Next steps:"
echo "  1. Set your terminal font to 'MesloLGS NF'"
echo "  2. Restart your shell or run: source ~/.zshrc"
echo "  3. Open Vim and run :PlugInstall to install plugins"
echo ""
