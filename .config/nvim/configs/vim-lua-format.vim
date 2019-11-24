
function! LuaFormat() 
	" here you have to set path to lua-format.py file from the repo. In this case it was be copy to /usr/local/bin directory
	pyf /home/user/.config/nvim/plugged/vim-lua-format/lua-format.py
endfunction

autocmd FileType lua nnoremap <buffer> <c-k> :call LuaFormat()<cr>
autocmd BufWrite *.lua call LuaFormat()
