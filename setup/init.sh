#!/bin/bash
# タップでクリックする
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool True
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# メニューバーに接続可能なAirPlayを表示しない
defaults write com.apple.airplay showInMenuBarIfPresent -bool False

# ネットワーク接続時に.DS_Storeファイルを生成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Dockの環境設定もろもろ
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock orientation -string right
defaults write com.apple.dock minimize-to-application -bool True
defaults write com.apple.dock show-process-indicators -bool False
defaults write com.apple.dock tilesize -int 52
defaults write com.apple.dock magnification -bool False
defaults write com.apple.dock autohide -bool True

# Finderの環境設定もろもろ
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
defaults write com.apple.finder NewWindowTargetPath -string file://${HOME}/
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write com.apple.finder ShowPathbar -bool True
defaults write com.apple.finder ShowRecentTags -bool False
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool False
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# iPhone接続時に写真アプリを起動させない
defaults write com.apple.ImageCapture disableHotPlug -bool YES

# メニューバーの表示をカスタマイズする
defaults write com.apple.menuextra.battery ShowPercent -string YES
defaults write com.apple.menuextra.clock DateFormat -string 'M\u6708d\u65e5(EEE)  H:mm'
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Volume.menu" "/System/Library/CoreServices/Menu Extras/TextInput.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"

# 画面キャプチャ取得時に影を付けない
defaults write com.apple.screencapture disable-shadow -boolean true

# 拡張子を常に表示する
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Fnキーを標準ファンクションに割り当てる
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# ボリュームを0にする
osascript -e "set Volume 0"

# ディスプレイのスリープ開始時間を10分にする
sudo pmset displaysleep 10

killall Dock
killall Finder
killall SystemUIServer

xcode-select --install
sudo xcodebuild -license accept

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade
brew install git
brew install go
brew install peco
brew install rbenv
brew install ruby-build
sudo mkdir /usr/local/include
sudo chown -R $USER /usr/local/include
sudo mkdir /usr/local/lib
sudo chown -R $USER /usr/local/lib
sudo mkdir Frameworks
sudo chown -R $USER /usr/local/Frameworks
brew install python
brew cleanup

brew cask install alfred
brew cask install appcleaner
brew cask install docker
brew cask install flux
brew cask install google-chrome
brew cask install google-japanese-ime
brew cask install iterm2
brew cask install java
brew cask install rubymine
brew cask install sequel-pro
brew cask install slack
brew cask install visual-studio-code
brew cask cleanup

# Preztoのインストール
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh


