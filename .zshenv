export PATH=/usr/local/bin:$PATH

# anyenv
if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH


if type vim > /dev/null 2>&1; then
  EDITOR=vim
else
  EDITOR=vi
fi
export EDITOR

case ${OSTYPE} in
    darwin*)
        if [[ -d /Applications/MacVim.app ]]; then 
            PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"
        fi
        ;;

    *) ;;
esac

if [ -r ~/.zshenv.local ]; then
  . ~/.zshenv.local
fi

