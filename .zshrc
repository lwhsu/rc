# prompt
PROMPT="%B%n@%m:%~ %(!.#.>)%b "

# history
HISTFILE=~/.histfile
HISTSIZE=8192
SAVEHIST=8192

zstyle :compinstall filename '/home/lwhsu/.zshrc'

autoload -Uz compinit
compinit

# aliases
alias ls='ls -AGFghko'
alias dir='ls -AGlFh'

alias bc='bc -q'
alias cd..='cd ..'
alias cls='clear'
alias cp='cp -i'
alias d='dig'
alias df'df -h'
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
