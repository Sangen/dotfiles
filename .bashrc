# vim, mvim
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi
if [ -f /Applications/MacVim.app/Contents/MacOS/mvim ]; then
  alias mvi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim'
  alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim'
fi
if [ -f /Applications/MacVim.app/Contents/MacOS/mvimdiff ]; then
  alias mvidiff='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvimdiff'
  alias mvimdiff='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvimdiff'
fi

# Sublime Text
if [ `uname` = 'Darwin' ]; then
  alias st='open -a Sublime\ Text'
fi


# color
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -G'


# git
GIT_COMPLETION_DIR=/usr/local/git/contrib/completion
if [ -f ${GIT_COMPLETION_DIR}/git-prompt.sh -a -f ${GIT_COMPLETION_DIR}/git-completion.bash ]; then
  source ${GIT_COMPLETION_DIR}/git-prompt.sh
  source ${GIT_COMPLETION_DIR}/git-completion.bash
  GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\]\$ '
fi


