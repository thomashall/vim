set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'majutsushi/tagbar'          	" Class/module browser

"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'		" Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repo

"---------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

call vundle#end()            		" required
filetype on
filetype plugin on
filetype plugin indent on

"=====================================================
" General settings
"=====================================================
set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup

set ruler
set completeopt-=preview
set gcr=a:blinkon0
set ttyfast

syntax on
colorscheme monokai


tab sball
set switchbuf=useopen

set visualbell t_vb=
set novisualbell

set enc=utf-8
set ls=2
set incsearch
set hlsearch
set nu
set scrolloff=5

set nobackup
set nowritebackup
set noswapfile

set guioptions-=T

set smarttab
set tabstop=8

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем на темном фоне текст
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

let g:snippets_dir = "~/.vim/vim-snippets/snippets"

set laststatus=2
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
map <F2> :TaskList<CR>
map <C-q> :bd<CR>

"=====================================================
" Python-mode settings
"=====================================================
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
let g:pymode_lint_write = 1
let g:pymode_virtualenv = 1
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 0
let g:pymode_run = 0

"=====================================================
" User hotkeys
"=====================================================

nnoremap <F5> :ConqueTermSplit ipython<CR>
nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

noremap <C-space> <C-x><C-o>
nnoremap <leader>Th :set ft=htmljinja<CR>
nnoremap <leader>Tp :set ft=python<CR>
nnoremap <leader>Tj :set ft=javascript<CR>
nnoremap <leader>Tc :set ft=css<CR>
nnoremap <leader>Td :set ft=django<CR>


"=====================================================
" Languages support
"=====================================================
" --- Python ---
"autocmd FileType python set completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
