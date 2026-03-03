DIRS=	.gnupg \
	.vim

FILES=	.cshrc \
	.gitconfig \
	.npmrc \
	.screenrc \
	.tmux.conf \
	.vimrc \
	.zshrc

PWD=`pwd -L`

all: diff

update:
	git pull
	git submodule update

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

diff:
.for d in ${DIRS}
	@find ${PWD}/${d} -type f | while read src; do \
		rel=$${src#${PWD}/}; \
		dst=$$HOME/$${rel}; \
		if [ ! -e "$$dst" ]; then \
			echo "$${rel}: will be installed (new file)"; \
		elif ! cmp -s "$$src" "$$dst"; then \
			echo "$${rel}: will be updated"; \
			diff -u "$$dst" "$$src" || true; \
		fi; \
	done
.endfor
.for f in ${FILES}
	@if [ ! -e ~/${f} ]; then \
		echo "${f}: will be installed (new file)"; \
	elif ! cmp -s ~/${f} ${PWD}/${f}; then \
		echo "${f}: will be updated"; \
		diff -u ~/${f} ${PWD}/${f} || true; \
	fi
.endfor
