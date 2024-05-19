
"colorscheme dw_green
syntax on
"set background=dark

"default setting
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

filetype on
au FileType yaml,yml set shiftwidth=2
au FileType yaml,yml set ts=2
au FileType yaml,yml set sts=2

"--------------------------------------------맨밑 상태바 표시 향상
set laststatus=2    "두줄로 표시
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\  "현재 라인 위치 출력
"------------------------------------------- au filetype (파일타입지정)
au FileType python map <f2> : !python3 %
au FileType python map <f3> : !sudo python3 % http://qqueueing.duckdns.org/product/1

call plug#begin('~/.vim/plugged')
	" easy surrounding
	Plug 'tpope/vim-surround'
	" easy handle file system tree
	Plug 'scrooloose/nerdtree'
	" easy auto pairs
	Plug 'jiangmiao/auto-pairs',
	" use airline
	Plug 'vim-airline/vim-airline'

	" use for snippet
	Plug 'sirver/ultisnips'
	let g:UltiSnipsExpandTrigger="<Tab>"
	let g:UltiSnipsJumpForwardTrigger="<Tab>"
	let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
	let g:UltiSnipsEditSplit="vertical"
	let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips']


	" Python ide
	Plug 'davidhalter/jedi-vim'
	let g:jedi#show_call_signatures=0       " 자세히 설명하는 창을 보여준다 1=활성화, 0=비>활성화

	" rust ide
	Plug 'rust-lang/rust.vim'
	let g:rustfmt_command = 'rustfmt'
	let g:rustfmt_command = 'rustfmt'


	" for auto completetion, syntax check
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
	let g:coc_disable_startup_warning = 1
	let g:LanguageClient_serverCommands = {
	\ 'rust': ['rust-analyzer'],
	\ }  
	au FileType rust map <f2> :Crun


	Plug 'rafi/awesome-vim-colorschemes'
	Plug 'arzg/vim-colors-xcode'

call plug#end()

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

"-----------------------------------------------------------------------"
" Aiarline
"-----------------------------------------------------------------------"
set laststatus=2
let g:airline#extensions#tabline#enabled = 1 "버퍼 목록 켜기
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" 파일명만 출력
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_highlighting_cache = 1

let g:airline_powerline_fonts = 1
let g:airline_theme= 'minimalist'
let g:airline_section_y = ''
let g:airline_section_warning= '' "마지막 status창 사용 안함
" 버퍼 목록 켜기
" 이 옵션은 버퍼를 수정한 직후 버퍼를 감춰지도록 한다.
" 이 방법으로 버퍼를 사용하려면 거의 필수다.
set hidden
