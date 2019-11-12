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

" W503: line break before binary operator
let g:ale_python_flake8_options = '--ignore=W503,C0111'

let g:ale_python_pycodestyle_options = '--max-line-length 100'

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
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%severity%] [%linter%] (%code%) %s'
