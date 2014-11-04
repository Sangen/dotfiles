# 環境変数
export LANG=ja_JP.UTF-8
 
 
# 色を使用出来るようにする
autoload -Uz colors; colors


#
# Keymap & Key Bindings
#
bindkey -v
bindkey '^U' backward-kill-line
# 履歴さかのぼり
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


#
# History
$ cat .zshrc                                                                                   [~]
# 環境変数
export LANG=ja_JP.UTF-8
 
 
# 色を使用出来るようにする
autoload -Uz colors; colors


#
# Keymap & Key Bindings
#
bindkey -v
bindkey '^U' backward-kill-line
# 履歴さかのぼり
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


#
# History
#
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE


#
# Prompt
#
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git

# 下のformatsの値をそれぞれの変数に入れてくれる機能の、変数の数の最大。
# デフォルトだと2くらいなので指定
zstyle ':vcs_info:*' max-exports 7
# 左から順番に、vcs_info_msg_{n}_ という名前の変数に格納される
zstyle ':vcs_info:*' formats '%R' '%S' '%b' '%s'
# 状態が特殊な場合のformats
zstyle ':vcs_info:*' actionformats '%R' '%S' '%b|%a' '%s'
# 4.3.10以上の場合は、check-for-changesという機能を使う。
autoload -Uz is-at-least
if is-at-least 4.3.10; then
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' formats '%R' '%S' '%b' '%s' '%c' '%u'
    zstyle ':vcs_info:*' actionformats '%R' '%S' '%b|%a' '%s' '%c' '%u'
fi

function echo_rprompt () {
    local repos branch st color

    STY= LANG=en_US.UTF-8 vcs_info
    if [[ -n "$vcs_info_msg_1_" ]]; then
        # -Dつけて、~とかに変換
        repos=`print -nD "$vcs_info_msg_0_"`
        branch="$vcs_info_msg_2_"

        if [[ -n "$vcs_info_msg_4_" ]]; then # staged
            branch="%F{yellow}$branch%f"
        elif [[ -n "$vcs_info_msg_5_" ]]; then # unstaged
            branch="%F{red}$branch *%f"
        else
            branch="%F{green}$branch%f"
        fi

        if [[ "$vcs_info_msg_1_" = '.' ]]; then
            # リポジトリルート
            print -n "[%40<..<"
            print -nD "%F{green}$repos%f"
            print -n "@$branch"
            print -n "%<<]"
        else
            # リポジトリルート以外のディレクトリ
            print -n "[%25<..<"
            print -n "%F{green}$vcs_info_msg_1_%f"
            print -n "%<<]"
            print -n "[%15<..<"
            print -nD "%F{green}$repos%f"
            print -n "@$branch"
            print -n "%<<]"
        fi
    else
        print -nD "[%F{green}%60<..<%~%<<%f]"
    fi
}
setopt prompt_subst
RPROMPT='`echo_rprompt`'
PROMPT='%(?.%F{green}.%F{red})$ %f'


#
# Line Editor
# 単語の区切り文字を指定する
#
autoload -U select-word-style; select-word-style default
zstyle ':zle:*' word-style unspecified
zstyle ':zle:*' word-chars " /=;@:{},|"


#
# Completion
#
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit; compinit -u
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


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
# ディレクトリ名だけでcdする
setopt auto_cd
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
# 高機能なワイルドカード展開を使用する
setopt extended_glob
# PROMPT変数内で変数参照する
setopt prompt_subst


#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"


#
# Aliases
#
alias ls="ls -G -w"
alias la="ls -a"
alias ll="ls -l"
# 削除前に確認
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '
# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# The Silver Searcher
if type ag > /dev/null 2>&1; then
  alias ag='ag --color-match 31 --color-path 4'
fi
 
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac
 
# vim:set ft=zsh:


#
# Local Settings
#
if [ -r ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi
