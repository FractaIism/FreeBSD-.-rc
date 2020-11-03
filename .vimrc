set number          " enable line numbers
set tabstop=4       " tab width when opening file
set softtabstop=4   " tab width when pressing Tab key
set shiftwidth=0    " shift width when using vim >> command (0=same as tabstop)
set expandtab       " replace tabs with spaces
set background=dark " fix hardly-visible comments
set ignorecase      " case-insensitive search
set smartcase       " show better-matching search result
set incsearch       " search while typing search string
set smartindent     " smart indent
set autowrite       " automatically save when window loses focus
set mouse=a         " allow using mouse in all modes
set whichwrap+=<,>,[,]    " wrap cursor to when reaching end of line
set backspace=indent,eol,start  " make backspace work in insert mode
set visualbell      " disable error sounds
set t_vb=           " clear visual bell length (disables flashing)
set undolevels=1000 " max number of changes that can be undone)
set ignorecase      " ignore case in search patterns
set foldmethod=indent   " enable folding, using indent to define blocks
set foldlevel=100       " start with all folds open


"set scrolloff=999   " Minimal number of screen lines to keep above and below the cursor (use 999 to keep cursor in the middle of the screen)
"set insertmode      " Makes Vim work like a standard text editor

color desert    " color theme
syntax enable   " syntax highlighting

" Line number coloring
highlight LineNr cterm=NONE ctermfg=Green ctermbg=NONE

" Updates vim editor as vimrc is modified
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" File type detection. Indent based on filetype.
if has ("autocmd")
    filetype plugin indent on
endif

" This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Remove trailing spaces on writeout
autocmd BufWritePre * %s/\s\+$//e

" disable newline-continuation of comments (useful when pasting code)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap w!! w !sudo tee % > /dev/null

" Disable mouse clicks in vim
" Why? enabling the mouse makes copy-pasting to other applications harder
" Enabling mouse but disabling mouse clicks preserves scrolling functionality
map <LeftMouse> <Nop>; map! <LeftMouse> <Nop>
map <RightMouse> <Nop>; map! <RightMouse> <Nop>
map <MiddleMouse> <Nop>; map! <MiddleMouse> <Nop>

