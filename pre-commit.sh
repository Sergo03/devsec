#!/bin/bash
GITLEAKS=$(git config --bool hooks.gitleaks-enable)
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
IS_INSTALLED=true

if [ "$GITLEAKS" = "false" ]; then
  echo "Gitleaks: disable"
  exit 1
else 
  echo "Gitleaks: enabled"
fi


gitleaks version || IS_INSTALLED=false

if [ $IS_INSTALLED  = false ]; then
if [ "$OS" = "darwin" ]; then
  echo "Gitleaks: install gitleaks on darwin"
  brew install gitleaks
elif [ "$OS" = "linux" ]; then
  echo "Gitleaks: install gitleaks on Linux..."
  wget https://github.com/gitleaks/gitleaks/releases/download/v8.16.4/gitleaks_8.16.4_linux_x64.tar.gz
  tar -xvf gitleaks_8.16.4_linux_x64.tar.gz
  sudo cp gitleaks /usr/local/bin
else
  echo "The operating system is not supported"
  exit 1
fi
else 
  echo "Gitleaks already installed"
fi

gitleaks protect --staged -v