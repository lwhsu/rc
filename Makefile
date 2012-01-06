FILES=.cshrc .gitconfig .vimrc
PWD=`pwd -L`

all: install

install:
.for f in ${FILES}
	@echo -n install ${f} ...
	@ln ${PWD}/${f} ~/${f}
	@echo ' done.'
.endfor
