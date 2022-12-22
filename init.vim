"
" General Settings
"
filetype plugin indent on
filetype plugin on
set noerrorbells                        " No sound when error
set mouse=a                             " Enable your mouse
source $VIMRUNTIME/mswin.vim
let mapleader = ' '
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set number                              " Line numbers
set wildmenu                            " Lets you have multiple
set clipboard+=unnamedplus               " Copy paste between vim and everything else
set undofile
set undodir=~/.config/nvim/undodir
set relativenumber                      " relative numbers 
set noswapfile                          " I hate swap files
set inccommand=nosplit
set encoding=UTF-8
set updatetime=300                      "update screen time or something
set hidden                              "TextEdit might fail if this isn't set ?
set cmdheight=2                         "more space for messages
set statusline=%!bufnr('%')
set laststatus=2                             " always show statusbar  
set syntax
set termguicolors

" check health suppressions

let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:python3_host_prog='./venv/bin/python'

"
" Plugins
"
call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua' " tree
    Plug 'chrisbra/vim-commentary' " commenter
    Plug 'chrisbra/Colorizer'      " asci colorizer
    Plug 'kien/ctrlp.vim'          " file fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " the goat
    Plug 'github/copilot.vim'      " copilot the goat (ai)
    Plug 'tpope/vim-fugitive'      " what branch am i on in the status bar
    Plug 'sbdchd/neoformat'        " auto formatter
    Plug 'kristijanhusak/vim-hybrid-material'   " color theme
call plug#end()



"
" default remaps
"
nnoremap tn :tabnew<CR>
nnoremap td  :tabclose<CR>
nnoremap tH  :tabfirst<CR>
nnoremap tL  :tablast<CR>
nnoremap <F5> :checktime<CR>

"
" Airline
"
" 
let g:airline_theme = "hybrid"


"
" nvim-tree
"

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

"
" vim-commentary
"
nnoremap <Space>c :Commentary<CR>
vnoremap <Space>c :Commentary<CR>


"
" ctrlp
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" look into this
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_tabpage_position = 'al'
let g:ctrlp_by_filename = 1
" let g:ctrlp_open_multiple_files = '2vj' ' cool feature look more into it
let g:ctrlp_lazy_update = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_mruf_max = 250
let g:ctrlp_match_window = 'bottom,max:12,results:50'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_follow_symlinks=1
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }

function BrightHighlightOn()
  hi CursorLine guibg=darkred
endfunction

function BrightHighlightOff()
  hi CursorLine guibg=#191919
endfunction

"
" fzf vim
"

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.9, 'height': 0.9,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files"
nnoremap <C-f> :Rg<CR>
nnoremap <silent> <Leader>Rg :Rg <C-R><C-W><CR>

"
" Coc
"
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

luafile ~/.config/nvim/lua-config/init.lua


" AUTOFORMAT

let g:neoformat_try_node_executable = 1
autocmd BufWritePre *.py Neoformat " autoformat on save
autocmd BufWritePre *.ts Neoformat " autoformat on save
" configure linting with neoformat
let g:neoformat_enabled_javascript = ['prettier']

"
" Appearence
"
set background=dark                     " tell vim what the background color looks like
syntax enable
let fancy_symbols_enabled = 1           " icons
" if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif
if (has("termguicolors"))
  set termguicolors
endif

""" SNIPPET REQUIRED FOR GOOD COLORS


highlight VertSplit cterm=NONE
set fillchars+=vert:\ 
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE
let g:enable_bold_font = 1
colorscheme hybrid_material

"""
