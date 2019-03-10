let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_timeout = 5
" for ultisnips
" let g:OmniSharp_want_snippet = 1

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

let g:ale_linters = { 
\ 'cs': ['OmniSharp'] 
\}


" Autoformatting
" autocmd InsertLeave *.cs OmniSharpCodeFormat
autocmd BufWritePre *.cs OmniSharpCodeFormat
