FILES=	.cshrc \
	.gitconfig \
	.screenrc \
	.vimrc
PWD=`pwd -L`

all: install

install:
.for f in ${FILES}
	@echo -n install ${f} ...
	@cp -f ${PWD}/${f} ~/${f}
	@echo ' done.'
.endfor
