call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-commentary'

call plug#end()

set relativenumber
set cursorline
set incsearch
set laststatus=2
set background=dark
colorscheme PaperColor
let g:lightline = { 'colorscheme': 'PaperColor' }
let g:ale_completion_enabled = 1

autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab
