### env
export LANG=ja_JP.UTF-8
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
export PATH=$PATH:/usr/local/sbin
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
case "${OSTYPE}" in
darwin*)
  # Mac
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  export PATH="$HOME/.scalaenv/bin:$PATH"
  eval "$(scalaenv init -)"
  ;;
linux*)
  # Linux
  ;;
esac

autoload -Uz colors
colors

### history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history        # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_all_dups # 同じコマンドをヒストリに残さない
setopt hist_ignore_space    # スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks   # ヒストリに保存するときに余分なスペースを削除する
setopt extended_history     # timestamp
function history-all { history -E 1 }

command_not_found_handler()
{
  tail -1 $HISTFILE |
    grep -F "$*" > /dev/null 2>&1 &&
    sed -i '$d' $HISTFILE
  return 127
}

REPORTTIME=3                # 3秒以上かかったコマンドは実行時間を表示する
TIMEFMT='
total  %E
user   %U
system %S
CPU    %P
cmd    %J'

bindkey "[Z" reverse-menu-complete    # Shift-Tabで補完を逆順
zle -A .backward-kill-word vi-backward-kill-word      # viキーバインドで
zle -A .backward-delete-char vi-backward-delete-char  # インサートモードに入る前の文字を消す

### prompts
setopt PROMPT_SUBST
function rprompt-git-current-branch {
    local name st color

    if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
        return
    fi
    name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
    
    if [[ -z $name ]]; then
        return
    fi

    st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
        color=${fg[green]}
    elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
        color=${fg[yellow]}
    elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
        color=${fg_bold[red]}
    else
        color=${fg[red]}
    fi

    echo "%{$color%}$name%{$reset_color%} "
}

prompt_exit_status="%(?.%F{green}%?%f.%F{red}%?%f)"
case "${OSTYPE}" in
darwin*)
  # Mac
  PROMPT=$'\U1F363'' [%F{green}%n@%m%f]%% '
  ;;
linux*)
  # Linux
  PROMPT='[%F{green}%n@%m%f]%% '
  ;;
esac
RPROMPT='(${prompt_exit_status})[`rprompt-git-current-branch`%~]'

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

fpath=(/usr/local/share/zsh-completions $fpath)

# 補完機能を有効にする
autoload -Uz compinit
compinit
# set colors
export LSCOLORS=cxfxcxdxbxegedabagacad
export LS_COLORS='di=01;32:ln=01;35:so=01;32:pi=33:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*:default' menu select=2
if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' ignore-parents parent pwd .. # ../ の後は今いるディレクトリを補完しない
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
/usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args' # ps コマンドのプロセス名補完

# 補完メッセージを読みやすくする
zstyle ':completion:*' verbose yes
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

cheat-sheet () { zle -M "`cat ~/zsh/cheat-sheet.conf`" }
zle -N cheat-sheet
bindkey "^[^h" cheat-sheet

git-cheat () { zle -M "`cat ~/zsh/git-cheat.conf`" }
zle -N git-cheat
bindkey "^[^g" git-cheat

setopt list_packed          # 補完を詰める
setopt globdots             # ドットファイルを*で選択する
setopt noautoremoveslash    # パスの最後のスラッシュを削除しない
setopt print_eight_bit      # 日本語ファイル名を表示可能にする
setopt no_beep              # beep を無効にする
setopt no_flow_control      # フローコントロールを無効にする
setopt ignore_eof           # Ctrl+Dでzshを終了しない
setopt interactive_comments # '#' 以降をコメントとして扱う
setopt AUTOCD               # ディレクトリ名だけでcdする
setopt auto_pushd           # cd したら自動的にpushdする
setopt auto_param_slash     # ディレクトリ名の補完で末尾の/を自動的に付加する。
setopt magic_equal_subst    # = 以降でも補完
setopt pushd_ignore_dups    # 重複したディレクトリを追加しない
setopt extended_glob        # 高機能なワイルドカード展開を使用する
setopt INTERACTIVE_COMMENTS
setopt AUTO_LIST
setopt NO_LIST_BEEP
setopt no_complete_aliases
########################################

# syntax highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi

basedir=$HOME
# peco
if which peco > /dev/null 2>&1 && [ -e "${basedir}/peco.zsh" ]; then
  source "${basedir}/peco.zsh"
fi
# alias
source "${basedir}/alias.zsh"

# C で標準出力をクリップボードにコピーする
if which pbcopy >/dev/null 2>&1 ; then
# Mac
alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
# Linux
alias -g C='| xsel --input --clipboard'
fi

function chpwd() { ls }
function name_dir()
{
  alias "$2"="cd $1"
}
name_dir ~/dotfiles/ d
name_dir ~/note n
name_dir ~/.vim/bundle/ v
name_dir ~/.ghq/github.com/ gh
name_dir ~/.ghq/github.com/s7o/ s7

function ghq-new()
{
  __new_base "$HOME/.ghq/github.com/s7o/$1"
}

# The next line updates PATH for the Google Cloud SDK.
# source '/Users/s7o/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
# source '/Users/s7o/google-cloud-sdk/completion.zsh.inc'
