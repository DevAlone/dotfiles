let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
			\ 'cs': ['omnisharp'],
			\})

let g:deoplete#ignore_case = 1 
" let g:deoplete#is_silent=1

" omnisharp doesn't work without this option
let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#omni#input_patterns = {}

call deoplete#custom#source('_',  'max_menu_width', 0)
call deoplete#custom#source('_',  'max_abbr_width', 0)
call deoplete#custom#source('_',  'max_kind_width', 0)
