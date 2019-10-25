" au BufWrite * :Autoformat

fun! AutoformatFile()
	" skip python's files
	if &ft =~ 'python\|py'
		return
	endif
	:Autoformat
endfun


autocmd BufWrite * call AutoformatFile()
