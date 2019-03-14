
map <C-n> :NERDTreeToggle<CR>
" find current file inside a nerdtree
" map <C-n> :NERDTreeFind<CR>

" nnoremap <leader>\ :call ToggleNERDTreeAndTagbar()<CR>
" nnoremap <F8> :call ToggleNERDTreeAndTagbar()<CR>

" { window split settings

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

" } window split settings

" { deoplete tab key
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" } deoplete tab key

" { omnisharp
" go to definition
autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
" autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
" autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
" find usages
autocmd FileType cs nnoremap <buffer> fu :OmniSharpFindUsages<CR>
" Finds members in the current buffer
" autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

" autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
" autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
" autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
" autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
" autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

" Navigate up and down by method/property/field
autocmd FileType cs nnoremap <buffer> <M-k> :OmniSharpNavigateUp<CR>
autocmd FileType cs nnoremap <buffer> <M-j> :OmniSharpNavigateDown<CR>

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <m-return> :OmniSharpGetCodeActions<CR>

" Run code actions with text selected in visual mode to extract method
" xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <F2> :OmniSharpRename<CR>

" { omnisharp

" { CtrlP
" go to file
map <buffer> gf :CtrlPMixed<CR>
" }

