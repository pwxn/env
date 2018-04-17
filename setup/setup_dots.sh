#! /bin/bash

if [ "$(uname)" == "Darwin" ]; then
  # h does not follow a symbolic link in resolving the second argument
  LINK='ln -sih'
else
  LINK='ln -si'
  MAC='NO'
fi

$LINK ~/env/dot/bash_profile ~/.bash_profile
$LINK ~/env/dot/bashrc ~/.bashrc
$LINK ~/env/dot/vimrc ~/.vimrc
$LINK ~/env/dot/gitconfig ~/.gitconfig
$LINK ~/env/dot/gitignore_global ~/.gitignore_global

if [ "$MAC" == "NO" ]; then
  exit 0
fi

# MacOS setup only below this point

rm -rf ~/Library/Developer/Xcode/UserData
$LINK ~/env/dot/UserData ~/Library/Developer/Xcode/UserData

chflags nohidden ~/Library
chflags hidden ~/Public ~/Sites
#chflags hidden ~/Music ~/Movies ~/Pictures

mkdir ~/var

open ~/env/dot/profile_export.terminal