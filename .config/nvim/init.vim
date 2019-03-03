filetype plugin on

set secure

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set scrolloff=10

" line length limiter
set colorcolumn=100
highlight ColorColumn ctermbg=darkgray

syntax on

" number of colors
set t_Co=256

" line nubering
set nu
" mouse support
set mouse=a

" hide blocks of code
" set foldcolumn=1

" disable swap and backup files
set nobackup
set noswapfile

" default encoding
set encoding=utf-8

let python_highlight_all = 1

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
" Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }  " is not maintaned anymore

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-go'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" autocompletion and some other cool features
" Plug 'valloric/youcompleteme'

" { For C# developement
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-dispatch'
Plug 'shougo/vimproc.vim', {'do' : 'make'}
Plug 'w0rp/ale'

" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" } For C# developement



" Plug 'zchee/deoplete-jedi'
" Plug 'neomake/neomake'
" Plug 'carlitux/deoplete-ternjs'

" Plug 'leafgarland/typescript-vim'

" Plug 'davidhalter/jedi-vim'
" Plug 'zchee/deoplete-jedi'

" Templates for js/ts
" Plug 'Quramy/vim-js-pretty-template'

" Plug 'majutsushi/tagbar'
" Plug 'DevAlone/neovim-complete-it'

" Plug 'vim-syntastic/syntastic'

call plug#end()

" For OmniSharp
" set completeopt-=preview
" let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
" set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono).
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1
" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5
" Fetch semantic type/interface/identifier names on BufEnter and highlight them
let g:OmniSharp_highlight_types = 1
" Show type information automatically when the cursor stops moving
autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
" Update the highlighting whenever leaving insert mode
autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()
autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
" Finds members in the current buffer
" autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

" autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
" autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
" autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
" autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
" autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
" Navigate up and down by method/property/field
autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
let g:ale_linters = { 
\ 'cs': ['OmniSharp'] 
\}

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <F2> :OmniSharpRename<CR>

" { Autoformatting
autocmd InsertLeave *.cs OmniSharpCodeFormat
" } Autoformatting

let g:go_fmt_command = "goimports"

" let g:jedi#completions_enabled = 0
let g:deoplete#enable_at_startup = 1

" <NERDTree & Tagbar

" autocmd vimenter * TagbarToggle
" autocmd vimenter * NERDTree

function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere=1
    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1
    let windowWidth = 36
    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
        wincmd J
        wincmd k
        wincmd L

        wincmd h
        execute 'vertical resize' windowWidth
    elseif tagbar_open
        NERDTree
        wincmd J
        wincmd k
        wincmd L

        wincmd h
        execute 'vertical resize' windowWidth
    else
        NERDTree
        TagbarOpen
        wincmd J
        wincmd k
        wincmd L

        wincmd h
        execute 'vertical resize' windowWidth
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction
"nnoremap <leader>\ :call ToggleNERDTreeAndTagbar()<CR>
nnoremap <F8> :call ToggleNERDTreeAndTagbar()<CR>

set completeopt-=preview

let g:OmniSharp_server_use_mono = 1

" nmap <F8> :TagbarToggle<CR>

" </NERDTree & Tagbar

" <Autoformat

" au BufWrite * :Autoformat

" </Autoformat

"set completeopt+=noinsert
let g:deoplete#enable_at_startup = 1

" deoplete-python settings
let g:deoplete#sources#jedi#show_docstring = 1

" :let g:neomake_python_enabled_makers = ['pep8', 'flake8', 'pyflakes']
" :let g:neomake_go_enabled_makers = ['go', 'gometalinter']
" :let g:neomake_go_gometalinter_args = ['-j1', '--disable=golint', '--disable=gas', '--disable=maligned']

autocmd FileType go nmap <leader>b  <Plug>(go-build)


nmap <A-F10> :qall<CR>

set clipboard=unnamedplus

nnoremap <f5> :%!jq -S .<CR>:w<CR>
nnoremap <f6> :set wrap!<CR>
nnoremap <F7> :set noet ci pi sts=0 sw=4 ts=4
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=100
set nofoldenable
nnoremap <A-]> zO
nnoremap <A-[> zc

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" autocmd! BufWritePost * Neomake
" autocmd! bufenter * Neomake
" call neomake#configure#automake('r', 100)
" call neomake#configure#automake('nw', 750)


" Use deoplete.
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

" Add extra filetypes

let g:tern#filetypes = [
            \ 'js',
            \ 'javascript.jsx',
            \ 'vue',
            \ '...'
            \ ]

" TypeScript

let g:typescript_indent_disable = 1

" <Window split settings

tnoremap <Esc> <C-\><C-n>
tnoremap <S-h> <C-\><C-N><C-w>h
tnoremap <S-j> <C-\><C-N><C-w>j
tnoremap <S-k> <C-\><C-N><C-w>k
tnoremap <S-l> <C-\><C-N><C-w>l

nnoremap <S-h> <C-w>h
nnoremap <S-j> <C-w>j
nnoremap <S-k> <C-w>k
nnoremap <S-l> <C-w>l

" nmap <silent> <A-Up> :wincmd k<CR>
" nmap <silent> <A-Down> :wincmd j<CR>
" nmap <silent> <A-Left> :wincmd h<CR>
" nmap <silent> <A-Right> :wincmd l<CR>

" nmap <silent> <A-k> :wincmd k<CR>
" nmap <silent> <A-j> :wincmd j<CR>
" nmap <silent> <A-h> :wincmd h<CR>
" nmap <silent> <A-l> :wincmd l<CR>


" resize window
" nnoremap <silent> <A-d> :exe "resize " . string(winheight(0) * 1.5)<CR>
" nnoremap <silent> <A-f> :exe "resize " . string(winheight(0) * 0.8)<CR>

nnoremap <silent> <S-d> :exe "resize +5"<CR>
nnoremap <silent> <S-f> :exe "resize -5"<CR>
nnoremap <silent> <S-g> :exe "vertical resize +5"<CR>
nnoremap <silent> <S-s> :exe "vertical resize -5"<CR>


nnoremap <silent> <A-d> :exe "resize +1"<CR>
nnoremap <silent> <A-f> :exe "resize -1"<CR>

" </Window split settings

" Deoplete tab key

inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" / Deoplete tab key

" <Python
let g:jedi#force_py_version=3
" </Python
