" au BufWrite * :Autoformat
let blacklist = [".py"]
autocmd BufWrite * if index(blacklist, &ft) < 0
