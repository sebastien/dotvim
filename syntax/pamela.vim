" Vim syntax file
" Language:   Pamela
" Authors:    Sebastien Pierre <sebastien@ffctn.com>
" Maintainer: Sebastien Pierre <sebastien@ffctn.com>
" Created:    2007-09-12
" Updated:    2015-05-06

" Tag classes, ids, labels
syn match   pamelaId            "#[A-Za-z0-9_-]*"       contained   nextgroup=pamelaClassSep,pamelaLabel
syn match   pamelaClassSep      "\."                    contained   nextgroup=pamelaClassSpecial,pamelaClass
syn keyword pamelaClassSpecial  do in out when use with hidden template widget contained  nextgroup=pamelaClassSep,pamelaLabel,pamelaId
syn match   pamelaClass         "[A-Za-z0-9_-]*"        contained   nextgroup=pamelaClassSep,pamelaLabel,pamelaId
syn match   pamelaLabel         ":.*"                   contained

" Tags
syn match   pamelaTag           "\s*<\w*[^\W\(\.#:]"    nextgroup=pamelaId,pamelaClassSep,pamelaLabel,pamelaAttributes,pamelaClassSpecial,pamelaClass
syn region  pamelaAttributes    start=+(+ end=+)+       contains=pamelaSpecialattribute,pamelaAttribute,pamelaAttribueVal,pamelaAttributeSep
syn match   pamelaAttribute     "[A-Za-z0-9_-]*="       contained nextgroup=pamelaAttributeVal
syn match   pamelaAttributeVal  "[^,\)]*"               contained nextgroup=pamelaAttributeSep
syn match   pamelaAttributeSep  ","                     contained nextgroup=pamelaAttribute

" Everything else
syn match   pamelaComment       "^\s*#.*$"              contains=pamelaCommentAnn
syn match   pamelaCommentAnn    /\v(TODO|NOTE|FIXME|BUG|DEBUG|SEE|WARNING|EOF).*/ contained

syn match   pamelaInclude       "^\s*%include .*$"

" Django Templates
syn match   pamelaTemplate      "\${.*}"
syn match   htmlEntity          "&[^; \t]+;"            contains=sgmlEntityPunct

syn region  pamelaString        start=+'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend
syn region  pamelaString        start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend

"-------------------------------------------------

hi def link pamelaComment       Comment
hi def link pamelaTag           Type
hi def link pamelaTemplate      Special
hi def link pamelaInclude       Special
hi def link htmlEntity          Number

hi def link pamelaId            Identifier
hi def link pamelaClassSep      Normal
hi def link pamelaClass         Statement
hi def link pamelaClassSpecial  PreProc
hi def link pamelaLabel         Constant

hi def link pamelaAttributes    Statement
hi def link pamelaAttribute     Statement
hi def link pamelaAttributeSpe  PreProc
hi def link pamelaAttributeVal  Constant

hi def link pamelaCommentAnn    Todo
hi def link pamelaString        String

" This does not work, I don't know why :/
let b:current_syntax = "pamela"

" EOF
