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
    Plug 'vim-airline/vim-airline-themes' " airline 
    Plug 'chrisbra/Colorizer'      " asci colorizer
    Plug 'kien/ctrlp.vim'          " file fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'        " better fuz
    Plug 'jreybert/vimagit'        " git integration
    Plug 'tpope/vim-fugitive'      " git airline

    " Color themes
    Plug 'kristijanhusak/vim-hybrid-material'   " color theme
call plug#end()

"
" Airline
"
" 
let g:airline_theme = "hybrid_material"

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
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
highlight VertSplit cterm=NONE
set fillchars+=vert:\ 
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE
colorscheme hybrid_material
let g:enable_bold_font = 1

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
