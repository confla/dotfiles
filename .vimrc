" General settings
set encoding=utf-8
inoremap <c-w> <c-g>u<c-w>
set backspace=indent,eol,start
set tabstop=4 shiftwidth=4 expandtab
filetype plugin indent on
syntax on
set term=xterm
set visualbell
set background=dark
hi Visual cterm=reverse ctermbg=NONE
set t_Co=256
set hlsearch

" Highlight any tab characters, trailing whitespaces and line length over 80 characters
highlight issue ctermbg=red
au VimEnter,WinEnter * match issue /\t\|\s\+$\|\%80v./

" Mouse control
set ttymouse=xterm2
set mouse=a

" Autocomplete in Vim
set complete=.,w,b,u,t
set completeopt=menuone,noinsert
highlight Pmenu ctermbg=gray ctermfg=black
highlight PmenuSel ctermbg=green ctermfg=black

" Statusline colour change with mode change
hi statusline ctermfg=green
hi User1 cterm=inverse,bold
au InsertEnter * hi statusline ctermfg=red
au InsertLeave * hi statusline ctermfg=green

" Custom statusline
set laststatus=2                            " always show statusbar
set statusline=
set statusline+=\ \ %-3.5{toupper(mode())}  " current mode
set statusline+=%1*%<\ %.60F\ %y\ %m        " filename,filetype,modified flag
set statusline+=%=                          " right align remainder
set statusline+=%0*\ \ [%n]%6l,%c%6p%%      " file position

" Check what machine is being run
let machine_check = system('echo $HOST | grep -c mac')
if machine_check == 1
    " Shortcuts without tmux and NERDTree
    nnoremap <silent> h :wincmd h<CR>
    inoremap <silent> h <ESC>:wincmd h<CR>i
    nnoremap <silent> j :wincmd j<CR>
    inoremap <silent> j <ESC>:wincmd j<CR>i
    nnoremap <silent> k :wincmd k<CR>
    inoremap <silent> k <ESC>:wincmd k<CR>i
    nnoremap <silent> l :wincmd l<CR>
    inoremap <silent> l <ESC>:wincmd l<CR>i
else
    " vim-plug: Vim plugin manager
    " :PlugInstall to install plugins
    " :PlugStatus to show status of current plugins
    " :PlugUpdate to update plugins
    " :PlugDiff to show differences since last update
    " :PlugClean to remove undeclared plugins
    call plug#begin('~/.vim/plugged')

    " Live linting
    Plug 'w0rp/ale'

    " File directory
    Plug 'scrooloose/nerdtree'

    " Tmux navigation
    Plug 'christoomey/vim-tmux-navigator'

    call plug#end()

    " NERDTree config
    let NERDTreeStatusline="%t"
    let NERDTreeShowHidden=1
    let NERDTreeNotificationThreshold=500
    let NERDTreeDirArrowExpandable = '+'
    let NERDTreeDirArrowCollapsible = '-'
    au vimenter * NERDTree
    au StdinReadPre * let s:std_in=1
    au vimenter * if !(argc() == 0 && !exists("s:std_in")) | wincmd p | endif
    au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    nnoremap <expr> 1 (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1) ? '<c-w>t' : ':NERDTree<CR>'

    " vim-tum-navigator config
    " If this is slow to go out of vim into tmux, look at .cshrc
    let g:tmux_navigator_no_mappings = 1
    nnoremap <silent> h :TmuxNavigateLeft<CR>
    inoremap <silent> h <ESC>:TmuxNavigateLeft<CR>i
    nnoremap <silent> j :TmuxNavigateDown<CR>
    inoremap <silent> j <ESC>:TmuxNavigateDown<CR>i
    nnoremap <silent> k :TmuxNavigateUp<CR>
    inoremap <silent> k <ESC>:TmuxNavigateUp<CR>i
    nnoremap <silent> l :TmuxNavigateRight<CR>
    inoremap <silent> l <ESC>:TmuxNavigateRight<CR>i
endif
