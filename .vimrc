call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
"Plug 'maxmellon/vim-jsx-pretty'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jiangmiao/auto-pairs'
Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'jreybert/vimagit'
Plug 'tpope/vim-commentary'
"Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vim-which-key'

call plug#end()

set number
set cursorline
set incsearch
set laststatus=2
set background=dark
set re=2
colorscheme PaperColor
let g:lightline = { 'colorscheme': 'PaperColor' }
let g:ale_completion_enabled = 1

autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab

let g:mapleader = "\<Space>"
nnoremap <silent> <leader> :<c-u>WhichKey 'SPC'<CR>

let g:which_key_map =  {}
let g:which_key_map['.'] = [':Files', 'Find project files']
let g:which_key_map['/'] = [':Files', 'Find project files']

let g:which_key_map['p'] = {
      \ 'name' : 'Projects',
      \ 'f' : [':Rg', 'Find project files'],
}

call which_key#register('SPC', "g:which_key_map")
