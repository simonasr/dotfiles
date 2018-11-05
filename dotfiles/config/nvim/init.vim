set directory=~/.vim/backup
set backupdir=~/.vim/backup   " keep swap files here
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'rodjek/vim-puppet'
Plug 'neomake/neomake'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'eagletmt/neco-ghc'

" All of your Plugs must be added before the following line
call plug#end()              " required

" Use deoplete
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1

" Nerdtree git plugin symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "ᵐ",
    \ "Staged"    : "ˢ",
    \ "Untracked" : "ᵘ",
    \ "Renamed"   : "ʳ",
    \ "Unmerged"  : "ᶴ",
    \ "Deleted"   : "ˣ",
    \ "Dirty"     : "˜",
    \ "Clean"     : "ᵅ",
    \ "Unknown"   : "?"
    \ }

" Other options
set relativenumber
set number
let mapleader=','
set backspace=2
" colorscheme dracula
syntax on
set shell=/bin/zsh 
set laststatus=2
set noshowmode

" Check the function above, these
" are my default values
set tabstop=2
set shiftwidth=2
set expandtab

