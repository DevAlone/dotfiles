call plug#begin('~/.config/nvim/plugged')

" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" print documentation of current method in the bottom
Plug 'Shougo/echodoc.vim'

" { linters
Plug 'dense-analysis/ale'
Plug 'vim-syntastic/syntastic'
" } linters
"

" { Autoformatting
Plug 'psf/black' " Python
" } Autoformatting

" { For C# developement
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-dispatch'
Plug 'shougo/vimproc.vim', {'do' : 'make'}
" syntax highlighting and something else
Plug 'OrangeT/vim-csharp'
" } For C# developement

Plug 'scrooloose/nerdtree'

" { For Go developement
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" autocompletion
Plug 'zchee/deoplete-go'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
" }

" { For C++ developement
" autocompletion
Plug 'Shougo/deoplete-clangx'
" #include completion
Plug 'Shougo/neoinclude.vim'
" linter
" } For C++ developement

"{ Python
Plug 'deoplete-plugins/deoplete-jedi'
"} Python
"

"{ Lua
" autocompletion dependency
Plug 'xolox/vim-misc'
" autocompletion
Plug 'xolox/vim-lua-ftplugin'
" indentation
" Plug 'drmingdrmer/vim-indent-lua'
" }

" nice tag bar to quickly navigate over the file
Plug 'majutsushi/tagbar'
" automatically close brackets
Plug 'jiangmiao/auto-pairs'

" { snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" } snippets


" quick navigation between files
Plug 'ctrlpvim/ctrlp.vim'

" cute bar below
" Plug 'vim-airline/vim-airline'

call plug#end()

" is needed for some plugins
filetype plugin on

set secure

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
" keep N lines below and above cursor when scrolling
set scrolloff=10

" line length limiter
set colorcolumn=100
highlight ColorColumn ctermbg=darkgray

" syntax highlighting
syntax on

" number of colors
set t_Co=256

" line nubering
set nu
" mouse support
set mouse=a

" automatically hides blocks of code
" set foldcolumn=3
set foldmethod=syntax
set foldlevel=0
" set foldclose=all
set foldnestmax=1

" disable swap and backup files
set nobackup
set noswapfile

" default encoding
set encoding=utf-8

" fixes autocompletion in : menu
set wildmode=longest,list,full
set wildmenu

" case insensitive search for commands
set ignorecase

" save folding between sessions
augroup Folds
	au BufWrite *.* mkview
	au BufRead *.* silent loadview
augroup END

for f in split(glob('~/.config/nvim/configs/*.vim'), '\n')
	exe 'source' f
endfor

" important to put at the end so it overrides all existing keys from plugins' configs
exe 'source' '~/.config/nvim/keys.vim'
