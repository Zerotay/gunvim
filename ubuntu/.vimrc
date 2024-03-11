
colorscheme dw_green
set background=dark

set hlsearch
set nu
set autoindent
set ts=4
set sts=4
set cindent
set laststatus=2
set shiftwidth=4
set showmatch
set smartcase
set smarttab
set smartindent
set ruler
set fileencodings=utf8,euc-kr
set encoding=utf-8

call plug#begin('~/.vim/plugged')
	Plug 'tpope/vim-surround'
	Plug 'scrooloose/nerdtree'
call plug#end()
