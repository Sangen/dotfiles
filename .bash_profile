PATH=/usr/local/bin:$PATH
export PATH
# Android sdk
export PATH=$PATH:/Applications/adt-bundle-mac/sdk/platform-tools

export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
