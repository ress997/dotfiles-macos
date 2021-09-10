#!/usr/bin/env zsh

# Command Line Tools for Xcode インストール
sudo xcode-select --install

# Rosetta2 インストール
#if [[ $(uname -m) == arm64 && ! -f /Library/Apple/System/Library/LaunchDaemons/com.apple.oahd.plist ]];then
sudo softwareupdate --install-rosetta --agree-to-license
#fi

# dotfile setup

# Homebrew {{{
if (( $+commands[brew] )); then
	# Install Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

exec zsh -l
brew bundle
exec zsh -l

## nextword
if (( $+commands[go] )); then
	open https://github.com/high-moctane/nextword-data/archive/large.tar.gz
	go install github.com/high-moctane/nextword@latest
fi
# }}}

# ネットワークドライブで.DS_Store を作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# USBドライブで.DS_Store を作成しない
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
killall Finder

# スクリーンショットの保存先を ~/Pictures/SS に変更
mkdir -p ~/Pictures/SS
defaults write com.apple.screencapture location ~/Pictures/SS
# スクリーンショットのファイル名からスクリーンショットを削除
defaults write com.apple.screencapture name ""
# スクリーンショットの保存形式を png に変更
defaults write com.apple.screencapture type png
# スクリーンショットに影を含めない
defaults write com.apple.screencapture disable-shadow -bool true
killall SystemUIServer

# LaunchPad 初期化
defaults write com.apple.dock ResetLaunchPad -bool true
killall Dock
