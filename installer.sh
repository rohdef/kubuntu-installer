#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "You must have root access, please prefix with sudo"
  exit 1
fi

echo ""
echo ""
echo "------------------------------------"
echo "Updating apt"
echo "------------------------------------"

if ! apt-get -qq update; then

  echo "Cannot update apt"
  exit 1
fi

echo ""
echo ""
echo "------------------------------------"
echo "apt updated"
echo "Removing old data"
echo "------------------------------------"

if ! rm -rf ./kubuntu-installer; then
  echo "Cannot delete old data in kubuntu-installer"
  exit 1
fi

echo ""
echo ""
echo "------------------------------------"
echo "Old data removed"
echo "Installing git"
echo "------------------------------------"

if ! apt-get -qy install git; then
  echo "Cannot install git, which is needed for the rest of the sources"
  exit 1
fi

echo ""
echo ""
echo "------------------------------------"
echo "git installed"
echo "Installing ruby-ncurses"
echo "------------------------------------"

if ! apt-get -qy install ruby-ncurses > /dev/null; then
  echo "Cannot install ruby-ncurses, which is needed by the script"
  exit 1
fi

echo ""
echo ""
echo "------------------------------------"
echo "ruby-ncurses"
echo "Cloning git repository with installer"
echo "------------------------------------"

if ! git clone -q https://github.com/rohdef/kubuntu-installer.git; then
  echo "Cannot clone git repoisitory with setup"
  exit 1
fi

echo ""
echo ""
echo "------------------------------------"
echo "Repository ready"
echo "Installing gem colorize"
echo "------------------------------------"

if ! gem install -q colorize; then
  echo "Error when installing gem colorize"
  exit 1
fi

echo ""
echo ""
echo "------------------------------------"
echo "colorize installed"
echo "Running full installer"
echo "------------------------------------"

if ! /usr/bin/ruby ./kubuntu-installer/apt_installer.rb; then
  echo "Installer failed"
  exit 1
else
  echo "Installation successful.  Have a Bastard day :) "
  exit 1
fi

