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

alias cd.. 'cd ..'
alias cls 'clear'
alias cp 'cp -i'
alias d 'dig'
alias df 'df -h'
alias du 'du -h'
alias grep 'grep --color'
alias mv 'mv -i'
alias my 'cd ~/my'
alias p 'ping'
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

setenv EDITOR vim
setenv PAGER '/usr/bin/less -Rg'

bindkey -k up history-search-backward
bindkey -k down history-search-forward

limit coredumpsize 0

setenv LSCOLORS ExGxFxdxCxDxDxBxBxacad

setenv LC_ALL en_US.UTF-8
setenv LC_CTYPE en_US.UTF-8
setenv LANG en_US.UTF-8

setenv CDIFFCOLORS 1:31:32:35

setenv SSH_AUTH_SOCK $HOME/.ssh/ssh-auth-sock

complete sudo   'p/1/c/'
complete gpg	c/--/"(search-keys refresh-keys)"/
