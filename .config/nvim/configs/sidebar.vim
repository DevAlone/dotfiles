" <NERDTree & Tagbar

" autocmd vimenter * TagbarToggle
" autocmd vimenter * NERDTree
autocmd vimenter * call ToggleNERDTreeAndTagbar()

" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

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
