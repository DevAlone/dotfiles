function! FormatCurrentLuaBuffer()
	" formates current buffer using lua-format
	" https://github.com/Koihik/LuaFormatter
	write !lua-format -i %
	edit!
endfunction

" autocmd BufWrite *.lua call FormatCurrentLuaBuffer()
" TODO: fix https://github.com/drmingdrmer/vim-indent-lua/issues/1
" indents code and returns to current line
" autocmd BufWrite *.lua :normal gg=G``
