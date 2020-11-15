"       Jad's init Vim 

" General NeoVim settings
source $HOME/.config/nvim/general/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keymappings/mappings.vim
source $HOME/.config/nvim/plug-configs/ale.vim

" Terminal Only
if !exists('g:vscode')
  source $HOME/.config/nvim/general/appearance.vim

" VSCodium only
else
  source $HOME/.config/nvim/vscode/settings.vim
  source $HOME/.config/nvim/keymappings/which-key.vim
endif

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
