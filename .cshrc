setenv host `hostname | awk -F. '{print $1}'`

setenv TERM xterm

if ($OSTYPE == "FreeBSD") then
		alias ls 'ls-F -AGFghko \!*'
		alias dir 'ls-F -AGlFh'
	else
		setenv term xterm-color
		alias ls 'ls --color -AF'
		alias dir 'ls --color -AFl'
endif

set path = ( ~/bin /usr/games/ $path )

alias bc 'bc -q'
alias cd.. 'cd ..'
alias cls 'clear'
alias cp 'cp -i'
alias d 'dig'
alias df 'df -h'
alias du 'du -h'
alias grep 'grep --color'
alias g grep
alias gdb 'gdb -q'
alias mv 'mv -i'
alias my 'cd ~/my'
alias p 'ping'
alias psa "ps -awx"
alias psm "psu $USER"
alias psr "psu root"
alias psu "/bin/ps -w -U \!* | less -EmrSw"
alias s 'ssh'
alias ssh 'printf "\033k\!*\033\134"; /usr/bin/ssh -2A4C \!*;'
alias t 'telnet'
alias tin 'tin -r'
alias x 'dig -x'

# prompt
set prompt = "%B%m:%~ -%n- " 
set prompt2 = "(%t %m)%~ #%% "
set prompt3 = "%SDo you mean [%R] (y/n/e) ? "

set autolist
set autoexpand

setenv EDITOR vim
alias vim '/usr/local/bin/vim -X'
alias vi vim
alias ivm vim
alias vm vim
setenv VISUAL $EDITOR

setenv PAGER '/usr/bin/less -Rg'
setenv LESS_TERMCAP_mb	'[1;31m'
setenv LESS_TERMCAP_md	'[1;33m'
setenv LESS_TERMCAP_me	'[0m'
setenv LESS_TERMCAP_so	'[1;44;33m'
setenv LESS_TERMCAP_se	'[0m'
setenv LESS_TERMCAP_us	'[1;32m'
setenv LESS_TERMCAP_ue	'[0m'
setenv LESSCHARDEF "8bcccbcc18b95.."

set history = 5000
set savehist = 5000
set noclobber

bindkey -k up history-search-backward
bindkey -k down history-search-forward
bindkey "\e[1~" beginning-of-line  # Home
bindkey "\e[2~" overwrite-mode     # Ins
bindkey "\e[3~" delete-char        # Delete
bindkey "\e[4~" end-of-line        # End
bindkey "\ew" backward-delete-word

limit coredumpsize 0

setenv LSCOLORS ExGxFxdxCxDxDxBxBxHCHB

setenv LC_ALL en_US.UTF-8
setenv LC_CTYPE en_US.UTF-8
setenv LANG en_US.UTF-8

setenv CDIFFCOLORS 1:31:32:35
#setenv DIFF_OPTIONS -ruN

setenv GREP_COLOR '1;32'

setenv SSH_AUTH_SOCK $HOME/.ssh/ssh-auth-sock

complete gpg	c/--/"(search-keys refresh-keys)"/
complete sudo   'p/1/c/'
complete which	'p/1/c/'

# FreeBSD development
alias dcvs	cvs -d dcvs.FreeBSD.org:/home/dcvs
alias pcvs	cvs -d pcvs.FreeBSD.org:/home/pcvs
alias projcvs	cvs -d projcvs.FreeBSD.org:/home/projcvs
alias scvs	cvs -d ncvs.FreeBSD.org:/home/ncvs

alias getpr	'/usr/local/bin/port getpr'

setenv CVSROOT		anoncvs@anoncvs.tw.FreeBSD.org:/home/ncvs
#setenv CVSROOT		/home/ncvs
setenv CVS_RSH		ssh
setenv ADDPCVSROOT	lwhsu@pcvs.FreeBSD.org:/home/pcvs
setenv USER		lwhsu

setenv P4PORT perforce.freebsd.org:1666
setenv P4USER lwhsu
