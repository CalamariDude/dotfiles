filetype plugin indent on
set wildmenu
set noerrorbells                        " No sound when error
set visualbell                          " Flash screen on error
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set fileencoding=utf-8                  " The encoding written to file
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set tabstop=4                           " Insert 4 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set number                              " Line numbers
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set updatetime=50                       " Faster completion
set clipboard=unnamedplus               " Copy paste between vim and everything else
set guifont=JetBrainsMono\ Nerd\ Font   " Set the gui Font
"

" Search
set incsearch                           " I'm Not sure what this does
set ignorecase                          " Ignore case when searching
set smartcase                            " But unignore if search has cases

" Environment variables
let g:python3_host_prog = $HOME . '/.virtualenvs/nvim/bin/python'