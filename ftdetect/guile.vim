if !exists('g:scheme_use_guile')
  let g:scheme_use_guile = 1
endif

if !exists('g:scheme_use_guix')
  let g:guile_use_guix = 0
endif

autocmd BufNewFile,BufRead *.scm call s:SelectSchemeFlavor()
autocmd BufNewFile,BufRead *.manifest call s:SelectSchemeFlavor()
autocmd BufNewFile,BufRead *.channels call s:SelectSchemeFlavor()

function! s:SelectSchemeFlavor()
  if g:scheme_use_guile == 1
    setlocal filetype=guile
  else
    setlocal filetype=scheme
  endif
endfunction
