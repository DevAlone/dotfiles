" let g:ale_linters = {
" \ 'cs': ['OmniSharp']
" \}

" let g:ale_linters_ignore = {'python': ['pylint']}

" let g:ale_linters = {
"			\'python': [
"			\'bandit',
"			\'flake8',
"			\'mypy',
"			\'prospector',
"			\'pycodestyle',
"			\'pydocstyle',
"			\'pyflakes',
"			\'pylama',
"			\'pylint',
"			\'pyls',
"			\'pyre',
"			\'vulture'
"			\]}

let g:ale_linters = {
			\'python': [
			\'pyls',
			\'flake8',
			\'pyflakes',
			\'pycodestyle',
			\]}

fun! SetPythonEnv()
	let extension = expand('%:e')
	if extension == 'py'
		let $PYTHONPATH .= ':./env/lib/python3.7/site-packages/'
	endif
endfun

call SetPythonEnv()

" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
highlight ALEWarning ctermbg=DarkYellow
highlight ALEError ctermbg=DarkRed

