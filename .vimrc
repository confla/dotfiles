" General settings
set backspace=indent,eol,start
set tabstop=2 shiftwidth=2 expandtab
filetype plugin indent on
syntax on
set term=xterm
set nowrap
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

" Statusline colour change with mode change
hi statusline ctermfg=green
hi User1 cterm=inverse,bold
au InsertEnter * hi statusline ctermfg=red
au InsertLeave * hi statusline ctermfg=green

" Check what machine is being run
let machine_tcsh_check = system('echo $HOST | grep -ce E113')
let machine_bash_check = system('echo $HOSTNAME | grep -ce E113')
if (machine_tcsh_check >= 1 || machine_bash_check >= 1)
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

    " Fuzzy search
    Plug 'ctrlpvim/ctrlp.vim'

    call plug#end()

    " NERDTree config
    let NERDTreeStatusline="%t"
    let NERDTreeShowHidden=1
    let NERDTreeNotificationThreshold=500
    let NERDTreeDirArrowExpandable = '+'
    let NERDTreeDirArrowCollapsible = '-'
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

    " ctrlp ignore files in .gitignore
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif
