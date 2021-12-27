#!/usr/bin/env bash

main() {
  # adding global gitignore
  git config --global core.excludesfile ~/.gitignore

  # unique path
  typeset -U path

  # macos

   # Disable the sound effects on boot
  sudo nvram SystemAudioVolume=" "

  # Set highlight color to green
  defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

  # Set sidebar icon size to medium
  defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

  # Disable the "Are you sure you want to open this application?" dialog
  defaults write com.apple.LaunchServices LSQuarantine -bool false

  # Restart automatically if the computer freezes
  sudo systemsetup -setrestartfreeze on

  # Never go into computer sleep mode
  sudo systemsetup -setcomputersleep Off > /dev/null

  # Enable full keyboard access for all controls
  # (e.g. enable Tab in modal dialogs)
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

  ###############################################################################
  # Screen                                                                      #
  ###############################################################################

  # Require password immediately after sleep or screen saver begins
  defaults write com.apple.screensaver askForPassword -int 1
  defaults write com.apple.screensaver askForPasswordDelay -int 0

   # Save screenshots to the desktop
  defaults write com.apple.screencapture location -string "${HOME}/Desktop"

  # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
  defaults write com.apple.screencapture type -string "png"

  # Disable shadow in screenshots
  defaults write com.apple.screencapture disable-shadow -bool true

  defaults -currentHost write -g AppleFontSmoothing -int 0

   ###############################################################################
  # Finder                                                                      #
  ###############################################################################

  # Finder: disable window animations and Get Info animations
  defaults write com.apple.finder DisableAllAnimations -bool true

  # Finder: show hidden files by default
  defaults write com.apple.finder AppleShowAllFiles -bool true

  # Finder: show all filename extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Finder: show status bar
  defaults write com.apple.finder ShowStatusBar -bool true

  # Finder: show path bar
  defaults write com.apple.finder ShowPathbar -bool true

  # Display full POSIX path as Finder window title
  defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

  # Keep folders on top when sorting by name
  defaults write com.apple.finder _FXSortFoldersFirst -bool true

  # When performing a search, search the current folder by default
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

  # Disable the warning when changing a file extension
  defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

  # Enable spring loading for directories
  defaults write NSGlobalDomain com.apple.springing.enabled -bool true

  # Remove the spring loading delay for directories
  defaults write NSGlobalDomain com.apple.springing.delay -float 0

  # Avoid creating .DS_Store files on network or USB volumes
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

  # Show item info to the right of the icons on the desktop
  /usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" $HOME/Library/Preferences/com.apple.finder.plist

  ###############################################################################
  # Dock, Dashboard, and hot corners                                            #
  ###############################################################################

  # Enable highlight hover effect for the grid view of a stack (Dock)
  defaults write com.apple.dock mouse-over-hilite-stack -bool true

  # Set the icon size of Dock items to 72 pixels
  defaults write com.apple.dock tilesize -int 72

  # Change minimize/maximize window effect
  defaults write com.apple.dock mineffect -string "scale"

  # Minimize windows into their applicationÕs icon
  defaults write com.apple.dock minimize-to-application -bool true

  # Show indicator lights for open applications in the Dock
  defaults write com.apple.dock show-process-indicators -bool true

  # Automatically hide and show the Dock
  defaults write com.apple.dock autohide -bool true

  ###############################################################################
  # Terminal & iTerm 2                                                          #
  ###############################################################################

  # Only use UTF-8 in Terminal.app
  defaults write com.apple.terminal StringEncodings -array 4

  # Enable Secure Keyboard Entry in Terminal.app
  # See: https://security.stackexchange.com/a/47786/8918
  defaults write com.apple.terminal SecureKeyboardEntry -bool true

  # Disable the annoying line marks
  defaults write com.apple.Terminal ShowLineMarks -int 0
}

main
