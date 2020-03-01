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
	\],
	\'go': [
		\'bingo', 
		\'gobuild', 
		\'gofmt', 
		\'golangci-lint', 
		\'golint', 
		\'gopls', 
		\'gosimple', 
		\'gotype', 
		\'govet', 
		\'golangserver', 
		\'staticcheck',
	\]
\}
" \'gometalinter', 

" C0111  # missing-module-docstring
" R0903  # [too-few-public-methods] Too few public methods (1/2)
" E501   # E501 line too long (87 > 79 characters)
" W0232  # [no-init] Class has no __init__ method
" W503   # line break before binary operator                                                          
let g:ale_python_flake8_options = '--ignore=C0111,R0903,E501,W0232,W503'

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

let g:ale_python_mypy_options = '--ignore-missing-imports --other-option'
" let g:ale_go_golangci_lint_options = '--enable-all --disable gomnd'
let g:ale_go_golangci_lint_options = '--enable-all'
