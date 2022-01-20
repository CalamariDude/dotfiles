"
" General Settings
"
filetype plugin indent on
filetype plugin on
set noerrorbells                        " No sound when error
set mouse=a                             " Enable your mouse
source $VIMRUNTIME/mswin.vim
set tabstop=4                           " Insert 4 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
let mapleader = ' '
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set number                              " Line numbers
set wildmenu                            " Lets you have multiple
" set clipboard=unnamedplus               " Copy paste between vim and everything else
" set clipboard^=unnamed,unnamedplus
set undofile
set undodir=~/.config/nvim/undodir
set relativenumber                      " relative numbers 
set noswapfile                          " I hate swap files
set inccommand=nosplit
set encoding=UTF-8
set updatetime=300                      "update screen time or something
set hidden                              "TextEdit might fail if this isn't set ?
set cmdheight=2                         "more space for messages
"statusline"
set statusline=%!bufnr('%')
set laststatus=2                             " always show statusbar  

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
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense
    Plug 'pappasam/coc-jedi'
    Plug 'dense-analysis/ale'
    Plug 'davidhalter/jedi-vim' " go to

    " Color themes
    Plug 'kristijanhusak/vim-hybrid-material'   " color theme
call plug#end()

" nnoremap <leader>b :ls<cr>:b<space>


"
" default remaps
"
nnoremap H :NvimTreeClose<CR>gT
nnoremap L :NvimTreeClose<CR>gt
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
" let g:ctrlp_user_command =
" \ 'find %s -type f | grep -v -P "\.jpg$|/tmp/"'          " MacOSX/Linux
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
" if executable('rg')
" let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
" let g:ctrlp_use_caching = 0
" endif
" let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
" \ --ignore .git
" \ --ignore .svn
" \ --ignore .hg
" \ --ignore .DS_Store
" \ --ignore "**/*.pyc"
" \ -g ""'
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


" Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
" \ 'bg':      ['bg', 'Normal'],
" \ 'hl':      ['fg', 'Comment'],
" \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
" \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
" \ 'hl+':     ['fg', 'Statement'],
" \ 'info':    ['fg', 'PreProc'],
" \ 'border':  ['fg', 'Ignore'],
" \ 'prompt':  ['fg', 'Conditional'],
" \ 'pointer': ['fg', 'Exception'],
" \ 'marker':  ['fg', 'Keyword'],
" \ 'spinner': ['fg', 'Label'],
" \ 'header':  ['fg', 'Comment'] }

" Get Files
" command! -bang -nargs=? -complete=dir Files
" \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
" command! -bang -nargs=* Rg
" \ call fzf#vim#grep(
" \   'rg --line-number --color=always --smart-case '.shellescape(<q-args>), 1,
" \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>1)

" Ripgrep advanced
" function! RipgrepFzf(query, fullscreen)
" let command_fmt = 'rg --line-number --color=always --smart-case %s' " || true'
" let initial_command = printf(command_fmt, shellescape(a:query))
" let reload_command = printf(command_fmt, '{q}')
" let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
" call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview('right:hidden', 'ctrl-/', spec), a:fullscreen)
" endfunction
" command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>1)


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

"
" Ale
"
" let b:ale_linters = ['black']
" let g:ale_fixers = {'python': ['trim_whitespace', 'remove_trailing_lines', 'autoflake']}
" let g:ale_fix_on_save = 1
"

" vim-jedi

" nnoremap gh jedi#
" disable autocompletion, because we already have completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
nnoremap <Space>d jedi#goto()
let g:jedi#quickfix_window_height=15

