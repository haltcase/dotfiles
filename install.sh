#!/usr/bin/env bash
set -e

# install fira code font
mkdir -p ~/.fonts
FIRA_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip"
ZIP_PATH="~/.fonts/FiraCode.zip"
curl -f -o $ZIP_PATH -sSL $FIRA_FONT_URL
unzip -u -d ~/.fonts $ZIP_PATH
fc-cache -v 

# install Starship prompt
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> ~/.bashrc

# symlink Starship settings
mkdir -p ~/.config
if [ ! -f ~/.config/starship.toml ]; then
  ln -s "$(pwd)/starship.toml" ~/.config/starship.toml
fi
