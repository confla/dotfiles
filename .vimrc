set encoding=utf-8
set backspace=indent,eol,start
filetype plugin indent on
syntax on	
inoremap <c-w> <c-g>u<c-w>
set tabstop=4 shiftwidth=4 expandtab
set term=xterm
au bufread * highlight OverLength ctermbg=red
au bufread * match OverLength /\%80v./
set visualbell
set background=dark

nnoremap l :wincmd l<CR>
inoremap l <ESC>:wincmd l<CR>i
nnoremap h :wincmd h<CR>
inoremap h <ESC>:wincmd h<CR>i
nnoremap k :wincmd k<CR>
inoremap k <ESC>:wincmd k<CR>i
nnoremap j :wincmd j<CR>
inoremap j <ESC>:wincmd j<CR>i

nnoremap § # 
inoremap § #

hi statusline ctermfg=green
hi User1 cterm=inverse,bold
au InsertEnter * hi statusline ctermfg=red
au InsertLeave * hi statusline ctermfg=green

set laststatus=2                            " always show statusbar  
set statusline= 
set statusline+=\ \ %-3.5{toupper(mode())}  " current mode  
set statusline+=%1*%<\ %.60F\ %y\ %m        " filename,filetype,modified flag  
set statusline+=%=                          " right align remainder  
set statusline+=%0*\ \ [%n]%6l,%c%6p%%      " file position
