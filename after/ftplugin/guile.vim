if exists('b:did_ftplugin')
  finish
endif

runtime! ftplugin/scheme.vim

setlocal lispwords+=define*
setlocal lispwords+=define-public
setlocal lispwords+=define-module
setlocal lispwords+=define-accessor
setlocal lispwords+=define-class
setlocal lispwords+=define-enumeration
setlocal lispwords+=define-inlinable
setlocal lispwords+=define-syntax-parameter

setlocal lispwords+=λ
setlocal lispwords+=lambda*

setlocal lispwords+=use-module

if get(g:, 'guile_use_guix', 0) == 1
  setlocal lispoptions=expr:1
  setlocal indentexpr=GetGuixIndent()

  setlocal lispwords+=modify-phases

  setlocal lispwords+=add-after
  setlocal lispwords+=replace

  setlocal lispwords+=with-imported-modules
  setlocal lispwords+=with-extensions

  setlocal lispwords+=wrap-program
endif

function! GetGuixIndent()
    let l:prev_lnum = prevnonblank(v:lnum - 1)
    let l:prev_line = getline(l:prev_lnum)

    let l:guix_package_fields = 'name\|version\|source\|build-system\|outputs\|arguments\|inputs\|native-inputs\|propagated-inputs\|native-search-paths\|search-paths\|replacement\|synopsis\|description\|home-page\|supported-systems\|license'

    if l:prev_line =~# '(\s*\(' . l:guix_package_fields . '\)\>' || l:prev_line =~# '(\(git-reference\)'
      let l:opens = count(l:prev_line, '(')
      let l:closes = count(l:prev_line, ')')

      if l:closes >= l:opens
        return lispindent(v:lnum)
      endif

      return lispindent(v:lnum) - 1
    endif

    " Fallback to Vim's internal lisp alignment calculation
    return lispindent(v:lnum)
  endfunction
