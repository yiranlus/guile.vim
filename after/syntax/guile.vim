scriptencoding utf-8

let s:cpo = &cpo
set cpo&vim

runtime! syntax/scheme.vim
unlet! b:current_syntax

if exists("b:current_syntax") && b:current_syntax == "guile"
  finish
endif

setlocal iskeyword+=-

syntax keyword schemeSyntax define*
syntax keyword schemeSyntax define-public
syntax keyword schemeSyntax define-module
syntax keyword schemeSyntax define-accessor
syntax keyword schemeSyntax define-class
syntax keyword schemeSyntax define-enumeration
syntax keyword schemeSyntax define-inlinable
syntax keyword schemeSyntax define-syntax-parameter

syntax keyword schemeSyntax λ
syntax keyword schemeSyntax lambda*

syntax keyword schemeSyntax use-modules

let b:current_syntax = "guile"

let &cpo = s:cpo
unlet s:cpo
