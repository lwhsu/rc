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
PATH=${PATH}:~/go/bin
export TERM=xterm-256color
export EDITOR=vim
export LSCOLORS=ExGxFxdxCxDxDxBxBxHCHB
export IFCONFIG_FORMAT=inet:cidr,inet6:cidr

export PAGER='/usr/bin/less -Rw'
export ACK_PAGER='less -r'
export LESS_TERMCAP_mb='[1;31m'
export LESS_TERMCAP_md='[1;33m'
export LESS_TERMCAP_me='[0m'
export LESS_TERMCAP_so='[1;44;33m'
export LESS_TERMCAP_se='[0m'
export LESS_TERMCAP_us='[1;32m'
export LESS_TERMCAP_ue='[0m'
#export LESSCHARDEF="8bcccbcc18b95.."

export GOPATH=~/go
PATH=${PATH}:${GOPATH}/bin

export SSL_CA_CERT_FILE=/usr/local/share/certs/ca-root-nss.crt

if [[ -n ${TMUX} ]]; then
    export SSH_AUTH_SOCK=${HOME}/.ssh/ssh-auth-sock
else
    if [ -S "${SSH_AUTH_SOCK}" ]; then
        /bin/ln -sf ${SSH_AUTH_SOCK} ${HOME}/.ssh/ssh-auth-sock
    fi
fi

export GPG_TTY=${TTY}

bindkey -e

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

autoload -U select-word-style
select-word-style bash

autoload -Uz vcs_info
precmd_vcs_info() {
    vcs_info
    if [[ -n ${vcs_info_msg_0_} ]]; then
        PROMPT="%B%n@%m:%~ {\${vcs_info_msg_0_}} %(!.#.>)%b "
    else
        PROMPT="%B%n@%m:%~ %(!.#.>)%b "
    fi
}
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

# aliases
alias ls='ls -AGF'
alias dir='ls -AGlFh'

alias bc='bc -q'
alias cal3='cal -3'
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
mkcd () { mkdir -p $1; cd $1 }
alias mv='mv -i'
alias open='xdg-open'
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
alias t6='telnet -6'
alias tin='tin -r'
alias x='drill -x'

# aliases for svn
svnann () { svn ann $* | less }
svndiff () { svn diff $* | diff-so-fancy }
svnlog () { svn log $* | less }
svnshow () { { svn log -c $1 && svn diff -c $1 } | diff-so-fancy }
