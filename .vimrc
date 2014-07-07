set nocompatible
filetype off			"required for vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'AutoComplPop'
Plugin 'ervandew/supertab'
Plugin 'gkz/vim-ls'
Plugin 'gtags.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'msanders/snipmate.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'digitaltoad/vim-jade'
Plugin 'fatih/vim-go'

call vundle#end()

filetype plugin indent on	"required for vundle

set laststatus=2 " for vim-airline

set backspace=indent,eol,start
set showcmd
set incsearch
set hlsearch

set background=dark
set ruler
set history=50
set showmatch
set showmode
set tabstop=8
set shiftwidth=8

set ignorecase
set smartcase

set autoindent
set cindent

set showtabline=2

syntax on
filetype plugin on

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp950,latin1,gbk,euc-jp,utf-16le,ucs-bom,gb2312,korea,gb18030
set termencoding=utf-8

"set nowrap

imap Oq 1
imap Or 2
imap Os 3
imap Ot 4
imap Ou 5
imap Ov 6
imap Ow 7
imap Ox 8
imap Oy 9
imap Op 0
imap On .
imap OQ /
imap OR *
imap Ol +
imap OS -
imap OM <CR>

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" cscope
if has("cscope")
set csprg=/usr/local/bin/cscope
set csto=0
set cst
set nocsverb
" add any database in current directory
if filereadable("cscope.out")
  cs add cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != ""
  cs add $CSCOPE_DB
endif
set csverb
set cscopetag
set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
endif

set nomodeline

autocmd Filetype cpp,c,java,cs set omnifunc=cppcomplete#Complete 

" Tab comoplete
"function! CleverTab()
"if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"return "\<Tab>"
"else
"return "\<C-N>"
"endfunction
"inoremap <Tab> <C-R>=CleverTab()<CR> 

" for txl syntax highlighting
au BufNewFile,BufRead *.Txl,*.txl,*.Grammar,*.grammar,*.Rules,*.rules,*.Module,*.module,*.Mod,*.mod,*.Grm,*.grm,*.Rul,*.rul set ft=txl

" for snippetEmu
"imap <F2> <Plug>Jumper
"let g:snip_start_tag = "@"
"let g:snip_end_tag= "@"
"set runtimepath+=~/.vim/snippetEmu
"set runtimepath+=~/.vim/snippetEmu/after

" for tSkeleton
"autocmd BufNewFile *.pl        TSkeletonSetup perl.pl
"autocmd BufNewFile *.py        TSkeletonSetup python.py
"let g:tskelDateFormat = "%b-%d-%Y"
"let g:tskelUserName	= "Li-Wen Hsu"
"let g:tskelUserEmail = "lwhsu@lwhsu.org"
"let g:tskelUserWWW = "http://lwhsu.org"
let g:tskelDir = "~/.vim/skeletons"

" for python.vim
"au FileType python source ~/.vim/plugin/python.vim
let python_highlight_all = 1

" for SuperTab & pyCallTips
let g:SuperTabDefaultCompletionType = "context"

" ins-completion options
hi Pmenu ctermbg=DarkBlue ctermfg=Grey
hi PmenuSel ctermbg=DarkGreen ctermfg=white
"set pumheight=16

set cursorline
highlight CursorLine cterm=none ctermbg=blue
"set cursorcolumn
"highlight CursorColumn cterm=none ctermbg=blue
map <F3> :set cursorline!<CR><Bar>:echo "Highlight active cursor line: " . strpart("OffOn", 3 * &cursorline, 3)<CR>

"highlight Search term=reverse ctermbg=green ctermfg=grey

" spelling check
map <F2> :set spell!<CR><Bar>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>

set nu
highlight LineNr term=bold cterm=NONE ctermfg=darkGrey ctermbg=none gui=NONE guifg=DarkGrey guibg=NONE 
map <F4> :set number!<CR><Bar>:echo "Line Number: " . strpart("OffOn", 3 * &number, 3)<CR>

"au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 

" xterm 256 colors
set t_Co=256

" Folding
set foldcolumn=5
set foldmethod=syntax
"set foldmethod=indent
highlight Folded ctermbg=none ctermfg=grey
highlight FoldColumn ctermbg=none ctermfg=white

" Comment color
hi Comment term=standout cterm=bold ctermfg=blue
"hi Comment term=standout cterm=bold ctermfg=59
" C Comment
autocmd FileType c inoremap /*          /**/<Left><Left>
autocmd FileType c inoremap /*<Space>   /*<Space><Space>*/<Left><Left><Left>
autocmd FileType c inoremap /*<CR>      /*<CR><backspace><backspace>*/<Esc>O
autocmd FileType c inoremap <Leader>/*  /*

" Parenthesis And Brackets
inoremap {      {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap (     ()<Left>
inoremap )     )<Esc>
               \y2l
               \:if '))'=="<C-R>=escape(@0,'"\')<CR>"<BAR>
               \  exec 'normal x'<BAR>
               \endif<CR>
               \a
inoremap [     []<Left>
inoremap ]     ]<Esc>
               \y2l
               \:if ']]'=="<C-R>=escape(@0,'"\')<CR>"<BAR>
               \  exec 'normal x'<BAR>
               \endif<CR>
               \a
"inoremap ( ()<Esc>:let leavechar=")"<CR>i
"inoremap [ []<Esc>:let leavechar="]"<CR>i
"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O

"set t_AB=[48;5;%dm
"set t_AF=[38;5;%dm

"map <PageDown> :call SmoothPageScrollDown()<CR>
"map <PageUp>   :call SmoothPageScrollUp()<CR>
"map <Space>   :call SmoothPageScrollDown()<CR>
"map <S-Space> :call SmoothPageScrollUp()<CR>

" Python related
au BufRead,BufNewFile *.py set ai et nu sw=4 ts=4 tw=79 expandtab
autocmd BufRead,BufNewFile *.py map <F5> :% w !python<CR>
autocmd BufRead,BufNewFile *.py vmap <F5> :w !python<CR>

" OCaml related
autocmd BufRead,BufNewFile *.ml map <F5> :% w !ocaml<CR>

" JavaScript related
autocmd BufRead,BufNewFile *.js map <F5> :% w !node<CR>

" LiveScript related
au BufRead,BufNewFile *.ls set ai et nu sw=4 ts=4 tw=79 expandtab

" Tabs
nmap <C-T>c :tabnew<CR>
nmap <C-T>k :tabclose<CR>
nmap <C-T>o :tabnew
nmap <C-H> :tabprev<CR>
nmap <C-L> :tabnext<CR>
nmap <C-left> :tabprev<CR>
nmap <C-right> :tabnext<CR>
imap <ESC><C-Left> :tabprev<CR>
imap <ESC><C-Right> :tabnext<CR>
nmap [D :tabprev<CR>
nmap [C :tabnext<CR>
imap [D <ESC>:tabprev<CR>
imap [C <ESC>:tabnext<CR>

" Tab
set listchars=tab:>-
"noremap ,st :list listchars=tab:>-<CR>
"noremap ,ct :set nolist<CR>
map <F7> :set list!<CR><Bar>:echo "Unprintable characters display: " . strpart("OffOn", 3 * &list, 3)<CR>

highlight DiffAdd cterm=none ctermfg=black ctermbg=Green gui=none guifg=black guibg=Green
highlight DiffDelete cterm=none ctermfg=black ctermbg=Red gui=none guifg=black guibg=Red
highlight DiffChange cterm=none ctermfg=black ctermbg=Yellow gui=none guifg=black guibg=Yellow
highlight DiffText cterm=none ctermfg=black ctermbg=Magenta gui=none guifg=black guibg=Magenta

set colorcolumn=80
highlight ColorColumn ctermbg=darkGrey

" tagbar
noremap <F8> :TagbarToggle<CR>
autocmd FileType cpp,c,java,cs,php :TagbarOpen
let g:tagbar_ctags_bin = '/usr/local/bin/exctags'
let g:tagbar_autoshowtag = 1

au BufRead,BufNewFile Vagrantfile set filetype=ruby

let g:go_disable_autoinstall = 1
