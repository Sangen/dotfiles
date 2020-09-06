### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


# Customize to your needs...

#
# git log のぺージャがlessで表示されていてutf-8に指定されていないと日本語が文字化けするため
#
export LESSCHARSET=utf-8

#
# History
#
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE


#
# Aliases
#
alias ls="ls -G -w"
alias la="ls -a"
alias ll="ls -l"

# 補完
autoload -U compinit && compinit


#
# Theme - Pure
#
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure


#
# anyframeのセットアップ
#
zinit light mollifier/anyframe

# Ctrl+b
# peco でディレクトリの移動履歴を表示
bindkey '^b' anyframe-widget-cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# Ctrl+r
# peco でコマンドの実行履歴を表示
bindkey '^r' anyframe-widget-put-history


#
# Other plugins
#
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-autosuggestions


#
# anyenv
#
eval "$(anyenv init -)"


# Load local zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
