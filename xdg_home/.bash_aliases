# Neovim
alias vim='nvim'
alias v='nvim'

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
