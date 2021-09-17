"       Jad's init Vim

"
" General Settings
"
filetype plugin indent on
filetype plugin on
set noerrorbells                        " No sound when error
set mouse=a                             " Enable your mouse
set tabstop=4                           " Insert 4 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set number                              " Line numbers
set clipboard=unnamedplus               " Copy paste between vim and everything else
set undofile
set undodir=~/.config/nvim/undodir
set relativenumber                      " relative numbers 
set noswapfile                          " I hate swap files
set inccommand=nosplit

"
" Plugins
"
call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua' " tree
    Plug 'chrisbra/vim-commentary' " commenter
    Plug 'vim-airline/vim-airline' " status line
    Plug 'chrisbra/Colorizer'      " asci colorizer
    Plug 'kien/ctrlp.vim'          " file fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'        " better fuz
call plug#end()

"
" Non-Plug plugins
"
set runtimepath^=~/.config/ctrlp.vim

"
" nvim-tree
"
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
let g:nvim_tree_auto_open = 1

"
" vim-commentary
"
nnoremap <Space>c :Commentary<CR>
vnoremap <Space>c :Commentary<CR>

"
" Appearence
"
set background=dark                     " tell vim what the background color looks like
syntax on
let fancy_symbols_enabled = 1           " icons
colorscheme torte                       " color scheme

"
" ctrlp
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1

"
" fzf vim
"
nnoremap <C-F> :Rg<CR>
