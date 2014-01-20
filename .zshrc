# prompt
PROMPT="%B%n@%m:%~ %(!.#.>)%b "

# history
HISTFILE=~/.histfile
HISTSIZE=8192
SAVEHIST=8192

# locale
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8


zstyle :compinstall filename '/home/lwhsu/.zshrc'

autoload -Uz compinit
compinit

# my settings
PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export EDITOR=vim
export LSCOLORS=ExGxFxdxCxDxDxBxBxHCHB

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

bindkey -e

# aliases
alias ls='ls -AGF'
alias dir='ls -AGlFh'

alias bc='bc -q'
alias cd..='cd ..'
alias cls='clear'
alias cp='cp -i'
alias d='dig'
alias df='df -h'
alias du='du -h'
alias grep='grep --color'
alias g='grep'
alias gdb='gdb -q'
alias mv='mv -i'
alias p='ping'
#ssh () {
#	printf '\033k'$*'\033\\'
#	/usr/bin/ssh -2A4C $*
#}
alias ssh='ssh -2A4C'
alias s='ssh'
alias t='telnet'
alias tin='tin -r'
alias x='dig -x'

# aliases for svn
svndiff () {
    svn diff "$*" | cdiff
}
