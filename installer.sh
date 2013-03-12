#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "You must have root access, please prefix with sudo"
  exit 1
fi

apt-get update

if ! apt-get install ruby-ncurses; then
  echo "Cannot install ruby-ncurses, which is needed by the script"
  exit 1
fi

if gem install colorize; then
  /usr/bin/ruby apt_installer.rb
fi
