#!env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install stow 

stow -d . -t ~ homebrew
stow -d . -t ~ zsh

echo "installing Brewfile contents... This may take awhile."
brew bundle install

#install doom
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

#install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
asdf plugin add erlang
asdf plugin add elixir
asdf plugin add rust
asdf plugin add ruby
asdf plugin add nodejs

asdf install erlang 24.2.1
asdf install elixir 1.13.3-otp-24
asdf install rust 1.58.1
asdf install ruby 2.6.9
