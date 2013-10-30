export LANG=ja_JP.UTF-8

PATH=$HOME:/usr/sbin:/usr/local/Cellar/imagemagick/6.6.4-5/bin:/opt/local/bin:/opt/depot_tools:/Developer/usr/bin:/bin/go_appengine
PATH=$PATH:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/local/sbin:/usr/local/share/python3:/usr/local/etc:/usr/local/share/npm/bin:$HOME/bin/
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


[ -f ~/.zsh/.zsh/git-completion.bash ] && source ~/.zsh/git-completion.bash

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
# bindkey "^h" backward-kill-word

# clipboardの共有
set clipboard=unnamed

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias hi="history"

alias dl="cd ~/Downloads"

# export CC=/usr/bin/gcc-4.2

### zaw
source ~/.zsh/zaw/zaw.zsh 
bindkey '^R' zaw-history

alias ec="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient --alternate-editor /Applications/Emacs.app/Contents/MacOS/Emacs"

export LSCOLORS=exfxcxdxbxegedabagacad
alias ls="ls -G"

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*:default' menu select=1

zstyle ':filter-select' case-insensitive yes # 絞り込みをcase-insensitiveに
bindkey '^@' zaw-cdr # zaw-cdrをbindkey

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

# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

### zshenv
if [ -f $HOME/.zshenv ]; then
  source $HOME/.zshenv
fi


if [ -x /usr/local/bin/brew ]; then
    BREW_PREFIX=`brew --prefix`
    fpath=($BREW_PREFIX/share/zsh/functions(N) $BREW_PREFIX/share/zsh/site-functions(N) $fpath)
fi

### z.sh
# autoload -Uz is-at-least
# 
# # Treat hook functions as array
# typeset -ga chpwd_functions
# typeset -ga precmd_functions
# typeset -ga preexec_functions
# 
# # Simulate hook functions for older versions
# if ! is-at-least 4.2.7; then
#   function chpwd() { local f; for f in $chpwd_functions; do $f; done }
#   function precmd() { local f; for f in $precmd_functions; do $f; done }
#   function preexec() { local f; for f in $preexec_functions; do $f; done }
# fi
# 
# function load-if-exists() { test -e "$1" && source "$1" }

# / で手前まで戻る
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"


### golang
export GOROOT=$HOME/go
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOROOT/bin

## 補完後，不要な "/" を削除する/しない
## auto-fu.zsh を利用する場合、autoremoveslash を unsetopt しておかないと
## パスを補完した際にスラッシュが二重になる。
## setopt no_auto_remove_slash
# unsetopt no_auto_remove_slash

# 右のプロンプト消す
setopt transient_rprompt

# nokogiriのヤツ
export DYLD_LIBRARY_PATH=/usr/local/opt/libxml2/lib:$DYLD_LIBRARY_PATH
# unset DYLD_LIBRARY_PATH

# autojump
BREW_PREFIX=`brew --prefix`
if [ -e $BREW_PREFIX/etc/autojump.zsh ]; then
    source $BREW_PREFIX/etc/autojump.zsh
fi
