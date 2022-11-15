#!/usr/bin/env bash
set -e

if [ ! -f ~/.fonts/FiraCode.zip ]; then
  # install fira code font
  mkdir -p ~/.fonts
  FIRA_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip"
  curl -f -o ~/.fonts/FiraCode.zip -sSL $FIRA_FONT_URL
  unzip -u -d ~/.fonts ~/.fonts/FiraCode.zip
  fc-cache -v
fi

if ! [ -x "$(command -v starship)" ]; then
  # install Starship prompt
  curl -sS https://starship.rs/install.sh | sh -s -- --yes
  echo 'eval "$(starship init bash)"' >> ~/.bashrc

  # symlink Starship settings
  mkdir -p ~/.config
  if [ ! -f ~/.config/starship.toml ]; then
    ln -s "$(pwd)/starship.toml" ~/.config/starship.toml
  fi
fi

exec $SHELL

