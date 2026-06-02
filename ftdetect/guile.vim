if !exists('g:scheme_use_guile')
    let g:scheme_use_guile = 1
endif

autocmd BufNewFile,BufRead *.scm call s:SelectSchemeFlavor()

function! s:SelectSchemeFlavor()
    if g:scheme_use_guile == 1
        setlocal filetype=guile
    else
        setlocal filetype=scheme
    endif
endfunction
