export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
# HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# DISABLE_MAGIC_FUNCTIONS="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd/mm/yyyy"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

### EXPORTS
export EDITOR='nvim'
export VISUAL='nvim'
export COLORTERM='truecolor'

### PATH
if [ -d "$HOME/.bin" ]
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -f "$HOME/.cargo/env" ]
  then source $HOME/.cargo/env
fi

if [ -d "/usr/local/go/bin" ]
  then PATH="/usr/local/go/bin:$PATH"
fi

if [ -d "$HOME/go" ]
  then PATH="$HOME/go/bin/:$PATH"
fi

if [ -d "$HOME/.nvm" ]
then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [ -d "$HOME/.rbenv" ]
  then PATH="$HOME/.rbenv/bin:$PATH"
fi

if [ -d "$HOME/.fzf" ]
  then [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### ALIASSES
# Neovim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

alias z='tmux-sessionizer'

# Shortcut to go to neovim folder
alias cdnc='cd ~/Projects/dotfiles/xdg_config/.config/nvim'

# Just in case exa isn't installed
if [ -x "/usr/local/bin/exa" ]
then
  alias ls='exa -h --color=always --group-directories-first'
  alias la='exa -ah --color=always --group-directories-first'
  alias ll='exa -lh --color=always --group-directories-first'
  alias lla='exa -lah --color=always --group-directories-first'
  alias l.='exa -ah --color=always --group-directories-first | rg "^\."'
else
  alias ls='ls -h --color=always --group-directories-first'
  alias la='ls -ah --color=always --group-directories-first'
  alias ll='ls -lh --color=always --group-directories-first'
  alias lla='ls -lah --color=always --group-directories-first'
  alias l.='ls -ah --color=always --group-directories-first | rg "^\."'
fi

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwrite
alias cp='cp -i'
alias mv='mv -i'
alias mv='mv -i'

# flags
alias df='df -h'
alias free='free -m'
alias nnn='nnn -de'

alias psa='ps auxf'

alias agi='sudo apt-get install '
alias agu='sudo apt-get update && sudo apt-get upgrade'
