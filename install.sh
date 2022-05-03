#!/usr/bin/env zsh

# Command Line Tools for Xcode インストール
sudo xcode-select --install

# Rosetta2 インストール
#if [[ $(uname -m) == arm64 && ! -f /Library/Apple/System/Library/LaunchDaemons/com.apple.oahd.plist ]];then
#	sudo softwareupdate --install-rosetta --agree-to-license
#fi

# dotfile setup

# Homebrew {{{
if (( $+commands[brew] -1 )); then
	# Install Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

exec zsh -l

if [[ -f Brewfile ]];then
	brew bundle
fi
# }}}

# mocword {{{
open https://github.com/high-moctane/mocword/releases/download/v0.2.0/mocword-aarch64-apple-darwin
open https://github.com/high-moctane/mocword-data/releases/download/eng20200217/mocword.sqlite.gz
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
