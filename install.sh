#!/usr/bin/env bash
set -ex

export DOT_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Requesting root access..."
sudo echo "Root Access Granted!"

echo "Installing xcode tools..."
xcode-select --install

echo "Installing apple defaults..."
source "$DOT_HOME/apple/defaults.bash"

echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing bash profile..."
ln -is "$DOT_HOME/.profile" ~/.profile

echo "Installing ssh folder..."
ln -is "$DOT_HOME/.ssh" ~/.ssh

echo "Installing gpg folder..."
ln -is "$DOT_HOME/.gnupg" ~/.gnupg

echo "Installing kube folder..."
ln -is "$DOT_HOME/.kube" ~/.kube

echo "Installing bash folder..."
ln -is "$DOT_HOME/.bash" ~/.bash

echo "Installing git config..."
ln -is "$DOT_HOME/.gitconfig" ~/.gitconfig

echo "Installing dev tools..."
brew update
brew install \
	asciinema \
	bash \
	bash-completion \
	fzf \
	git \
	git-lfs \
	github/gh/gh \
	gpg \
	helm \
	icdiff \
	jq \
	k9s \
	kubectl \
	kubectx \
	node \
	pinentry-mac \
	python3 \
	ruby \
	telnet \
	wget \
	;
ln -s /usr/local/bin/python3 /usr/local/bin/python
ln -s /usr/local/bin/pip3 /usr/local/bin/pip
rm /usr/local/bin/kubectl || true
brew unlink kubernetes-cli || true
brew link kubernetes-cli

echo "Installing python dependencies"
pip3 install black pre-commit httpie sqlparse

echo "Changing default shell..."
echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash

echo "Setting MacOS Defaults..."
defaults write NSGlobalDomain KeyRepeat -int 1 # fast key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 10 # fast key repeat
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true # don't open iphoto

echo "Copying hosts file..."
sudo ln -fs "$DOT_HOME/etc/hosts" /etc/hosts

if [ -d "/Applications/Sublime Text.app/" ]; then
  echo "Installing Sublime Shortcut..."
  sudo ln -fs "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
fi

if [ -d "/Applications/Sublime Merge.app/" ]; then
  echo "Installing Sublime Merge Shortcut..."
  sudo ln -s /Applications/Sublime\ Merge.app/Contents/SharedSupport/bin/smerge /usr/local/bin/smerge
fi

if [ -d ~/Library/Application\ Support/Sublime\ Text\ 3/Packages ]; then
  echo "Installing Sublime User Packages..."
  sudo mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/.User.bak
  sudo ln -s ~/Dropbox/Sublime/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
fi
