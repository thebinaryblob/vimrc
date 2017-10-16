"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Configure and run Vundle to manage plugins
" => Some taken from: https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" => https://dougblack.io/words/a-good-vimrc.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                    " required
filetype off                        " required
set rtp+=~/.vim/bundle/Vundle.vim   " Set the runtime path to include Vundle and initialize
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tpope/vim-commentary'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'tpope/vim-surround'

" Color related plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'sjl/badwolf'

" Syntac completion
Bundle 'Valloric/YouCompleteMe'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Menu and search related
" => Many settings taken from https://github.com/amix/vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler
set smartcase               " When searching try to be smart about cases
set wildmenu                " Turn on the WiLd menu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color scheme and colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable               " Enable syntax highlighting
let python_highlight_all=1
syntax on

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Alternative color scheme
" colors zenburn
" colorscheme badwolf

if has('gui_running')
    set background=light
else
    set background=dark
endif






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smarttab        " Be smart when using tabs ;)
set expandtab       " Use spaces instead of tabs
set shiftwidth=4
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing

" Linebreak on 500 characters
set lbr
set tw=500

set ai              "Auto indent
set si              "Smart indent
set wrap            "Wrap lines

" Mark extra whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set number         " show current line number
set relativenumber " show relative line numbers
set showcmd        " show command in bottom bar
set cursorline     " highlight current line






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Movement
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nnoremap j gj
nnoremap k gk






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype specific configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8               " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac            " Use Unix as the standard file type

" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" JavaScript
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Configure for installed plugins
" => Some taken from: https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" SimplyFold
nnoremap <space> za             " Enable folding with the spacebar
