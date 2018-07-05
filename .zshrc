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
zstyle ':completion:*' menu select

fpath=(~/.zsh/completion /usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit

# my settings
PATH=~/bin:~/local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
PATH=${PATH}:/usr/local/texlive/2016/bin/x86_64-darwin
PATH=${PATH}:~/node_modules/.bin
export TERM=xterm-256color
export EDITOR=vim
export LSCOLORS=ExGxFxdxCxDxDxBxBxHCHB
export PAGER='/usr/bin/less -Rg'

export GOPATH=~/go

export PYTHONPATH=~/local/lib/python2.7/site-packages

export SSL_CA_CERT_FILE=/usr/local/share/certs/ca-root-nss.crt

if [[ -n ${TMUX} ]]; then
    export SSH_AUTH_SOCK=$HOME/.ssh/ssh-auth-sock
else
    /bin/ln -sf $SSH_AUTH_SOCK $HOME/.ssh/ssh-auth-sock
fi

export GPG_TTY=${TTY}

bindkey -e

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

backward-delete-to-slash () {
    local WORDCHARS=${WORDCHARS//\//}
    zle .backward-delete-word
}
zle -N backward-delete-to-slash
bindkey "\e\b" backward-delete-to-slash

# aliases
alias ls='ls -AGF'
alias dir='ls -AGlFh'

alias bc='bc -q'
alias cd..='cd ..'
alias cls='clear'
alias cp='cp -i'
alias d='drill'
alias df='df -h'
alias du='du -h'
alias f='find ./ -name'
alias grep='grep --color'
alias g='grep'
alias gve="grep -ve '^$' | grep -ve '^#'"
alias gdb='gdb -q'
alias mv='mv -i'
alias p='ping'
alias p6='ping6'
#ssh () {
#	printf '\033k'$*'\033\\'
#	/usr/bin/ssh -2A4C $*
#}
alias ssh='ssh -2AC'
alias s='ssh -4'
alias s6='ssh -6'
alias t='telnet'
alias tin='tin -r'
alias x='drill -x'

# aliases for svn
svndiff () {
    svn diff "$*" | cdiff
}
