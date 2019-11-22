" autocmd BufWritePre *.go GoImports

" save folding between sessions
augroup GoFolds
  au BufWrite *.go mkview
  au BufRead *.go silent loadview
augroup END
let g:go_fmt_experimental = 1
