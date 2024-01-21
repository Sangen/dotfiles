### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node

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

# 補完
autoload -U compinit && compinit

#
# Option
#
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# beep を無効にする
setopt no_beep
# フローコントロールを無効にする
setopt no_flow_control
# '#' 以降をコメントとして扱う
setopt interactive_comments
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

#
# Aliases
#
alias ls="ls -G -w"
alias la="ls -a"
alias ll="ls -l"

# trash (https://formulae.brew.sh/formula/trash) のrmエイリアス
if type trash > /dev/null 2>&1; then
    alias rm='trash -F'
fi

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
zstyle ':chpwd:*' recent-dirs-max 1000

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


# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# pipenv
# プロジェクト直下にvenv仮想環境を作る設定を有効化
# この設定を行わない場合は、`~/.local/share/virtualenvs/{ProjectName}{Random}`に生成される
export PIPENV_VENV_IN_PROJECT=1


# Load local zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


# # 処理時間プロファイル(.zshenvの記述もコメント解除する必要あり)
# # $ time ( zsh -i -c exit ) をターミナルで実行
# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi