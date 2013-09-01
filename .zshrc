export LANG=ja_JP.UTF-8

PATH=$HOME:/usr/sbin:/usr/local/Cellar/imagemagick/6.6.4-5/bin:/opt/local/bin:/opt/depot_tools:/Developer/usr/bin:
PATH=$PATH:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/local/sbin:/usr/local/share/python3:/usr/local/etc:/usr/local/share/npm/bin
export PATH

TERM=xterm-256color

HISTFILE=~/.zsh_history      # ヒストリファイルを指定
HISTSIZE=100000              # ヒストリに保存するコマンド数
SAVEHIST=100000              # ヒストリファイルに保存するコマンド数
setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history         # コマンド履歴ファイルを共有する
setopt append_history        # 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
#setopt hist_ignore_space    # 先頭がスペースの場合、ヒストリに追加しない


# zsh-completions
fpath=(~/.zsh/completion $fpath)

autoload -U compinit
compinit -u

# ディレクトリ名を入力するだけでカレントディレクトリを変更
setopt auto_cd

# pushd popd
setopt auto_pushd

# タブキー連打で補完候補を順に表示
setopt auto_menu

# 自動修正機能(候補を表示)
#setopt correct

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧でファイルの種別を識別マーク表示(ls -F の記号)
setopt list_types

# パスの最後に付くスラッシュを自動的に削除しない
setopt noautoremoveslash

# cd - と入力してTabキーで今までに移動したディレクトリを一覧表示
setopt auto_pushd

#setopt rm_star_wait         # rm * を実行する前に確認
setopt rm_star_silent        # rm * を実行する前に確認しない
#setopt no_clobber           # リダイレクトで上書きを禁止
unsetopt no_clobber          # リダイレクトで上書きを許可

# カーソル位置から前方削除(Ctrl-u)
bindkey '^U' backward-kill-line

# Ctrl-h で単語ごとに削除
bindkey "^h" backward-kill-word

# clipboardの共有
set clipboard=unnamed

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias hi="history"

alias downloads="cd ~/Downloads ; pwd"
alias dl="cd ~/Downloads"
alias pd="cd ~/doc/perl/"

export CC=/usr/bin/gcc-4.2


### zsh anything
typeset -A HISTORY_INCREMENTAL_KEYS
set -A HISTORY_INCREMENTAL_KEYS A 1 S 2 D 3 F 4 G 5 H 6 J 7 K 8 L 9 Q 10 \
    W 11 E 12 R 13 T 14 Y 15 U 16 I 17 O 18 P 19
ISHR_PREVIOUS_QUERY=""
typeset -A ISHR_PREVIOUS_RESULTS
ISHR_BASEFILE=/tmp/ishr.tmp
ISHR_MENU_LENGTH=19

# キー入力の前後で実行する関数の設定。
ISHR_JUDGE_SEARCH_HOOK=(ishr-judge-query-length)

# 検索結果を表示しはじめる検索を開始するバッファの文字列長。
ISHR_MIN_SEARCH_LENGTH=2

function ishr-get-target-history() {
    local query=$1
    local target_file=""

    (( $+ISHR_PREVIOUS_RESULTS[(e)$query] )) && target_file=$ISHR_PREVIOUS_RESULTS[$query]

    if [ -z "$target_file" ]; then
        if [ -n "$query" ]; then
            # クエリに対するファイルを割り振る。
            ISHR_PREVIOUS_RESULTS+=($query ${ISHR_BASEFILE}.`ls ${ISHR_BASEFILE}* | wc -l`)
            echo "$query $ISHR_PREVIOUS_RESULTS" >> test.txt

            if [ -n "$ISHR_PREVIOUS_QUERY" -a `echo "$query" | grep -c "$ISHR_PREVIOUS_QUERY"` -gt 0 ]; then
                # 前回候補が今回のqueryに含まれていたら、前回の結果から絞り込む。
                egrep -i "$query" $ISHR_PREVIOUS_RESULTS[$ISHR_PREVIOUS_QUERY] | uniq > $ISHR_PREVIOUS_RESULTS[$query]
            else
                # 前回候補と異なる場合、または初回検索の場合は、初回取得した全履歴から検索する。
                egrep -i "$query" $ISHR_BASEFILE | uniq | tac > $ISHR_PREVIOUS_RESULTS[$query]
            fi
            target_file=${ISHR_PREVIOUS_RESULTS[$query]}
        else
            target_file=${ISHR_BASEFILE}.`ls ${ISHR_BASEFILE}* | wc -l`
            tail -$ISHR_MENU_LENGTH $ISHR_BASEFILE | tac > $target_file
        fi
    fi

    zle -M  "`ruby -e '%w[A S D F G H J K L Q W E R T Y U I O P ].zip(open(ARGV[0]).readlines){|k,l| print %[#{k}: #{l}]}' =(tail -$ISHR_MENU_LENGTH $target_file)`"
    zle -R

}

function incremental-search-history-regexp() {
    local query=$1
    local key=$2

    ishr-enable-search $query
    if [ $? -eq 1 ]; then
    # 特定キーが押されたら、該当する位置の履歴をバッファに表示する。
        if [ -n "${HISTORY_INCREMENTAL_KEYS[$key]}" ]; then
            zle -A .self-insert self-insert
            local fname=$ISHR_PREVIOUS_RESULTS[$ISHR_PREVIOUS_QUERY]
            BUFFER="`head -${HISTORY_INCREMENTAL_KEYS[$key]} $fname | tail -1 | perl -pe 's/\\\\n/\\021\\n/g'`"
            zle -R
            zle accept-line
        else
            ishr-get-target-history $query
        fi
        ISHR_PREVIOUS_QUERY=$query
    fi
}

function ishr-enable-search() {
    local query=$1

    for i in $ISHR_JUDGE_SEARCH_HOOK; do
        case "`$i $query`" in
            "enable")
                return 1
                ;;
        esac
    done
    return 0
}

ishr-judge-query-length() {
    [[ ${#1} -ge $ISHR_MIN_SEARCH_LENGTH ]] && echo "enable" || echo "disable"
}

function ishr-self-insert() {
    LBUFFER+=${KEYS[-1]}
    incremental-search-history-regexp $BUFFER ${KEYS[-1]}
}

function ishr-backward-delete-char() {
    zle -A .backward-delete-char backward-delete-char
    zle backward-delete-char
    zle -N backward-delete-char ishr-backward-delete-char
    incremental-search-history-regexp $BUFFER
}

function incremental-search-history-menu() {
    # インクリメンタル履歴検索を行えるように準備等を行う。
    integer stat

    # 初回限定で、履歴全体をuniq化して保持しておく。
    history -n 1 | uniq > $ISHR_BASEFILE

    # 各固有変数のリセット
    typeset -A ISHR_PREVIOUS_RESULTS
    ISHR_PREVIOUS_RESULTS=()
    ISHR_PREVIOUS_QUERY=""

    # 正規表現によるインクリメンタル検索を行う。

    zle -N self-insert ishr-self-insert
    zle -N backward-delete-char ishr-backward-delete-char
    zle recursive-edit
    stat=$?
    zle -A .self-insert self-insert
    zle -A .backward-delete-char backward-delete-char

    zle -R -c

    rm ${ISHR_BASEFILE}*
    (( stat )) && zle send-break

    return $?
}

zle -N incremental-search-history-menu

### zaw
source ~/.zsh/zaw/zaw.zsh 
bindkey '^R' zaw-history

### auto-fu
# if [ -f ~/.zsh/auto-fu.zsh ]; then
# source ~/.zsh/auto-fu.zsh
#     function zle-line-init () {
#         auto-fu-init
#     }
#     zle -N zle-line-init
#     zstyle ':completion:*' completer _oldlist _complete
# fi

### Emacs
[[ $EMACS = t ]] && unsetopt zle

alias ec="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient --alternate-editor /Applications/Emacs.app/Contents/MacOS/Emacs"


### mosh
# if [ $TERM = screen ]; then
# function mosh_tmux() {
#      eval server=\${$#}
#      tmux new-window -n $@ "exec ssh $@"
# }
# alias mosh=mosh_tmux
# fi

#zsh-git-prompt

# RPROMPT=$(print "%B%{\e[34m%}%m:%(2~,%-1~/.../%2~,%~)%{\e[33m%}%# %b")

export LSCOLORS=exfxcxdxbxegedabagacad
alias ls="ls -G"

# autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
# add-zsh-hook chpwd chpwd_recent_dirs
# zstyle ':chpwd:*' recent-dirs-max 5000
# zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*:default' menu select=1

zstyle ':filter-select' case-insensitive yes # 絞り込みをcase-insensitiveに
# bindkey '^@' zaw-cdr # zaw-cdrをbindkey

alias mvim="open -a /Applications/MacVim.app"



# prompt

PROMPT="%(?.['-']%%.[%F{red}'x'%f]%%) "

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

setopt prompt_subst

function rprompt-git-current-branch {
        local name st color gitdir action
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
        name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
        if [[ -z $name ]]; then
                return
        fi

        gitdir=`git rev-parse --git-dir 2> /dev/null`
        action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

        st=`git status 2> /dev/null`
if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=%F{green}
elif [[ -n `echo "$st" | grep "^no changes added"` ]]; then
                color=%F{yellow}
elif [[ -n `echo "$st" | grep "^# Changes to be committed"` ]]; then
                color=%B%F{red}
        else
                color=%F{red}
        fi

        echo "$color$name$action%f%b "
}

RPROMPT='[`rprompt-git-current-branch`%~]'

# 3秒以上かかった処理は詳細表示
REPORTTIME=3

[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias

# AWS
AWS_CONFIG_FILE=~/awscli.conf
export AWS_CONFIG_FILE

# autoload bashcompinit
# bashcompinit

# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

### perlbrew
if [ -f $HOME/.perlbrew/etc/bashrc ]; then
  source $HOME/.perlbrew/etc/bashrc
fi

### zshenv
if [ -f $HOME/.zshenv ]; then
  source $HOME/.zshenv
fi

### z.sh

autoload -Uz is-at-least

# Treat hook functions as array
typeset -ga chpwd_functions
typeset -ga precmd_functions
typeset -ga preexec_functions

# Simulate hook functions for older versions
if ! is-at-least 4.2.7; then
  function chpwd() { local f; for f in $chpwd_functions; do $f; done }
  function precmd() { local f; for f in $precmd_functions; do $f; done }
  function preexec() { local f; for f in $preexec_functions; do $f; done }
fi

function load-if-exists() { test -e "$1" && source "$1" }

# z - jump around {{{2
# https://github.com/rupa/z
_Z_CMD=j
_Z_DATA=$HOME/.z
if is-at-least 4.3.9; then
  load-if-exists $HOME/.zsh/z/z.sh
else
  _Z_NO_PROMPT_COMMAND=1
  load-if-exists $HOME/.zsh/z/z.sh && {
    function precmd_z() {
      _z --add "$(pwd -P)"
    }
    precmd_functions+=precmd_z
  }
fi
test $? || unset _Z_CMD _Z_DATA _Z_NO_PROMPT_COMMAND
#}}}


# / で手前まで戻る
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


### golang
program_exists () {
  type "$1" &> /dev/null ;
}

if program_exists go; then
  function setupGOROOT()
  {
    local GOPATH=`which go`
    local GODIR=`dirname $GOPATH`
    local GOPATH_BREW_RELATIVE=`readlink $GOPATH`
    local GOPATH_BREW=`dirname $GOPATH_BREW_RELATIVE`
    export GOROOT=`cd $GODIR; cd $GOPATH_BREW/..; pwd`
  }
  setupGOROOT
fi
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# 補完後，不要な "/" を削除する/しない
# auto-fu.zsh を利用する場合、autoremoveslash を unsetopt しておかないと
# パスを補完した際にスラッシュが二重になる。
#setopt no_auto_remove_slash
unsetopt no_auto_remove_slash

# 右のプロンプト消す
setopt transient_rprompt
