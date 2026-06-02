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

" For Guix
setlocal lispwords+=modify-phases
setlocal lispwords+=add-after
