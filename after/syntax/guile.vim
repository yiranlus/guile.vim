scriptencoding utf-8

let s:cpo = &cpo
set cpo&vim

runtime! syntax/scheme.vim
unlet! b:current_syntax

if exists("b:current_syntax") && b:current_syntax == "guile"
  finish
endif

setlocal iskeyword+=-

syntax keyword guileSyntax define*
syntax keyword guileSyntax define-public
syntax keyword guileSyntax define-module
syntax keyword guileSyntax define-accessor
syntax keyword guileSyntax define-class
syntax keyword guileSyntax define-enumeration
syntax keyword guileSyntax define-inlinable
syntax keyword guileSyntax define-syntax-parameter

syntax keyword guileSyntax λ
syntax keyword guileSyntax lambda*

syntax keyword guileSyntax use-modules

highlight def link guileSyntax Statement

let b:current_syntax = "guile"

let &cpo = s:cpo
unlet s:cpo
