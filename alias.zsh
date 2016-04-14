### zsh alias
alias la='ls -a'
alias ll='ls -la'
alias ...='cd ../..'
alias ....='cd ../../..'
alias vimr='vim ~/.vimrc'
alias vi='vim'
alias cp='cp -iv'
alias mv='mv -iv'
alias grep='grep --binary-files=without-match --color=auto'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias mkdir='mkdir -p'
alias h='history -f'
alias ha='history-all'
alias t='tmux'
alias tre='tree'
alias src='exec zsh'
alias c='cat'
alias g='git'
alias vf='vim +VimFiler'

alias be='bundle exec'
alias bi='bundle install'
alias b='bundle'
# sudo の後のコマンドでエイリアスを有効にする
# alias sudo='sudo '

# global alias
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g GI='| grep -i'
alias -g X='| xargs'
alias -g XG='| xargs grep'
alias -g P='| peco'

### suffix alias
function extract() {
  local tmp_dir="$(mktemp -d --tmpdir=./)"
  local archive_file_name="$(basename "$1")"
  # /dev/null に投げてるのはchpwd対策
  local absolute_path="$(cd $(dirname $1) > /dev/null 2>&1 && pwd)/${archive_file_name}"

  while read line; do
    local s=$(echo -n $line | cut -d' ' -f1)
    if [[ ${archive_file_name} == *${s} ]] then
      local suffix=$s
      local command="$(echo $line | sed -E 's/^[.a-zA-Z0-9]+ +//')"
      break
    fi
  done < <(echo  \
'.tar.gz  tar xzvf
.tgz     tar xzvf
.tar.xz  tar Jxvf
.zip     unzip
.lzh     lha e
.tar.bz2 tar xjvf
.tbz     tar xjvf
.tar.Z   tar zxvf
.gz      gzip -dc
.bz2     bzip2 -dc
.Z       uncompress
.tar     tar xvf')

  # 展開
  ln -s "${absolute_path}" "${tmp_dir}/${archive_file_name}"
  (
    cd "${tmp_dir}" > /dev/null 2>&1
    ${=command} ${archive_file_name} || exit 1
    rm "${archive_file_name}"
  )
  # 展開が失敗していれば、tmp_dirを消して1を返す
  if [[ $? != '0' ]] ; then
    rm -rf "${tmp_dir}"
    return 1
  fi

  local dir_name="$(ls -A "${tmp_dir}")"
  if [[ -d "${tmp_dir}/${dir_name}" ]]; then
    if [[ -d "./${dir_name}" ]]; then
      (
        echo "cannot move directory '${dir_name}': File exists"
        echo "extracted files in ${tmp_dir}/${dir_name}"
      ) 1>&2
      return 1
    else
      'mv' "${tmp_dir}/${dir_name}" ./
      rm -rf "${tmp_dir}"
    fi
  else
    local dir_name="$(basename "${archive_file_name}" "${suffix}")"
    if [[ -d "./${dir_name}" ]]; then
      (
        echo "cannot move directory '${dir_name}': File exists"
        echo "extracted directory as ${tmp_dir}"
      ) 1>&2
    else
      'mv' "${tmp_dir}" "${dir_name}"
    fi
  fi
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract
alias -s py='python'
alias -s rb='ruby'
alias -s rs='rustc'
alias -s scala='scala'
alias -s hs='runhaskell'
alias -s go='go run'
alias -s php='php -f'
alias -s txt='cat'
alias -s java='javac'
alias -s jl='julia'
alias -s exs='elixir'

function extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

case "${OSTYPE}" in
darwin*)
  # Mac
  alias ls="ls -GF"
  alias -s html='open'
  alias eog='open -a Preview'
  alias -s {png,jpg,bmp,PNG,JPG,BMP}=eog
  ;;
linux*)
  # Linux
  alias ls='ls -F --color'
  ;;
esac

# rails
alias -g RET="RAILS_ENV=test"
alias -g RED="RAILS_ENV=development"
alias -g REP="RAILS_ENV=production"

# rake
alias raket='RAILS_ENV=test rake'
alias raked='RAILS_ENV=development rake'
alias rakep='RAILS_ENV=production rake'
