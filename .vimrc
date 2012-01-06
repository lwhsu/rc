set nocompatible
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
filetype on
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
set csprg=/usr/bin/cscope
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

" for taglist.vim
"autocmd FileType cpp,c,java,cs :TlistToggle
"let Tlist_Auto_Open = 1
let Tlist_Ctags_Cmd = '/usr/local/bin/exctags'
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Process_File_Always = 1
let Tlist_Use_Right_Window = 1
"let Tlist_WinWidth = 24
nnoremap <silent> <F8> :TlistToggle<CR>

" for SuperTab & pyCallTips
let g:SuperTabDefaultCompletionType = "<C-N>"

" ins-completion options
hi Pmenu ctermbg=DarkBlue ctermfg=Grey
hi PmenuSel ctermbg=DarkGreen ctermfg=white
"set pumheight=16

set cursorline
highlight CursorLine cterm=none ctermbg=blue
"set cursorcolumn
"highlight CursorLine cterm=none ctermbg=blue
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

autocmd BufNewFile,BufRead svk-commit*.tmp setf svk

"set t_AB=[48;5;%dm
"set t_AF=[38;5;%dm

"map <PageDown> :call SmoothPageScrollDown()<CR>
"map <PageUp>   :call SmoothPageScrollUp()<CR>
"map <Space>   :call SmoothPageScrollDown()<CR>
"map <S-Space> :call SmoothPageScrollUp()<CR>

autocmd BufRead,BufNewFile *.py map <F5> :% w !python<CR>
autocmd BufRead,BufNewFile *.py vmap <F5> :w !python<CR>
