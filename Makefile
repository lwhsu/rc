DIRS=	.vim

FILES=	.cshrc \
	.gitconfig \
	.screenrc \
	.vimrc

PWD=`pwd -L`

all: install

install:
.for d in ${DIRS}
	@echo -n install ${d} ...
	@cp -fR ${PWD}/${d} ~/${d}
	@echo ' done.'
.endfor
.for f in ${FILES}
	@echo -n install ${f} ...
	@cp -f ${PWD}/${f} ~/${f}
	@echo ' done.'
.endfor
