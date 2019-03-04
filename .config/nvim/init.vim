call plug#begin('~/.config/nvim/plugged')
" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" print documentation of current method in the bottom
Plug 'Shougo/echodoc.vim'

" { For C# developement
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-dispatch'
Plug 'shougo/vimproc.vim', {'do' : 'make'}
" linter
Plug 'w0rp/ale'
" syntax highlighting and something else
Plug 'OrangeT/vim-csharp'
" } For C# developement

Plug 'scrooloose/nerdtree'
" Plug 'fatih/vim-go'
" Plug 'zchee/deoplete-go'
" Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" autocompletion and some other cool features
" Plug 'valloric/youcompleteme'

Plug 'majutsushi/tagbar'
" automatically close brackets
Plug 'jiangmiao/auto-pairs'
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
set foldcolumn=3

" disable swap and backup files
set nobackup
set noswapfile

" default encoding
set encoding=utf-8


" nnoremap <f5> :%!jq -S .<CR>:w<CR>
" nnoremap <f6> :set wrap!<CR>
" nnoremap <F7> :set noet ci pi sts=0 sw=4 ts=4
" set foldmethod=syntax
" set foldcolumn=1
" set foldlevelstart=100
" set nofoldenable
" nnoremap <A-]> zO
" nnoremap <A-[> zc

for f in split(glob('~/.config/nvim/configs/*.vim'), '\n')
    exe 'source' f
endfor

" source $HOME/.config/nvim/configs/keys.vim
" source $HOME/.config/nvim/configs/omnisharp.vim
" source $HOME/.config/nvim/configs/deoplete.vim
" source $HOME/.config/nvim/configs/echodoc.vim
