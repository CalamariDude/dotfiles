call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale' " linter
Plug 'preservim/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'ayu-theme/ayu-vim'


  if exists('g:vscode')
    " VSCodium Only

    " Easymotion
    Plug 'ChristianChiarulli/vscode-easymotion'
    
    " See what you yanked
    Plug 'machakann/vim-highlightedyank'
    

  else

    Plug 'puremourning/vimspector'

    if has('nvim') || has('patch-8.0.902')
      Plug 'mhinz/vim-signify'
    else
      Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
    endif
    
    " Tree
    Plug 'preservim/nerdtree'
    " Easymotion
    Plug 'easymotion/vim-easymotion'
   
    " See what keys do like in emacs
    Plug 'liuchengxu/vim-which-key'
  endif

call plug#end()

