alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias mvi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim'
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim'
alias mvidiff='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvimdiff'
alias mvimdiff='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvimdiff'

if [ `uname` = 'Darwin' ]; then
  alias st='open -a Sublime\ Text\ 2'
fi
