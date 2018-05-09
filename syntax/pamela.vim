" Vim syntax file
" Language:   Pamela
" Authors:    Sebastien Pierre <sebastien@ffctn.com>
" Maintainer: Sebastien Pierre <sebastien@ffctn.com>
" Created:    2007-09-12
" Updated:    2015-12-07


" 
" Tag classes, ids, labels
syn match   pamelaId            "#[A-Za-z0-9_-]*"       contained   nextgroup=pamelaClassSep,pamelaLabel
syn match   pamelaClassSep      "\."                    contained   nextgroup=pamelaClassSpecial,pamelaClassBase,pamelaClass
syn keyword pamelaClassSpecial  action do in out ui when use with hidden template widget contained  V T nextgroup=pamelaClassSep,pamelaLabel,pamelaId
syn keyword pamelaClassBase     left right expand expand-w expand-h to-w to-n to-s to-h clear clear-after 
syn match   pamelaClass         "[A-Za-z0-9_-]*"        contained   nextgroup=pamelaClassSep,pamelaLabel,pamelaId
syn match   pamelaLabel         ":.*"                   contained
syn match   pamelaBadIndent     /\v\t*[ ]+\t+/

" Tags
syn match   pamelaTag           "\s*<\w*[^\W\(\.#:]"    nextgroup=pamelaId,pamelaClassSep,pamelaLabel,pamelaAttributes,pamelaClassSpecial,pamelaClass
syn match   pamelaXSLTag        "\s*<xsl::\w*[^\W\(\.#:]"    nextgroup=pamelaId,pamelaClassSep,pamelaLabel,pamelaAttributes,pamelaClassSpecial,pamelaClass
syn match   pamelaNSTag         "\s*<jsx::\w*[^\W\(\.#:]"    nextgroup=pamelaId,pamelaClassSep,pamelaLabel,pamelaAttributes,pamelaClassSpecial,pamelaClass
syn region  pamelaAttributes    start=+(+ end=+)+       contains=pamelaSpecialattribute,pamelaNSAttribute,pamelaAttribute,pamelaAttribueVal,pamelaAttributeSep
syn match   pamelaAttribute     "[A-Za-z0-9_-]*="                  contained nextgroup=pamelaAttributeVal
" FIXME: If I use a regexp instead of jsx it won't work :(
syn match   pamelaNSAttribute   "jsx::[A-Za-z0-9_-]*="       contained nextgroup=pamelaAttributeVal
syn match   pamelaAttributeVal  "[^,\)]*"                          contained nextgroup=pamelaAttributeSep
syn match   pamelaAttributeSep  ","                                contained nextgroup=pamelaAttribute

" Everything else
syn match   pamelaComment       "^\s*#.*$"              contains=pamelaCommentAnn
syn match   pamelaCommentAnn    /\v(TODO|NOTE|FIXME|BUG|DEBUG|SEE|WARNING|EOF).*/ contained

syn match   pamelaInclude       "^\s*%include .*$"
syn match   pamelaUse           "^\s*%use .*$"
syn match   pamelaMacro         "^\s*@.*$"

" Django Templates
syn match   pamelaTemplate      "\${.*}"
syn match   htmlEntity          "&[^; \t]+;"            contains=sgmlEntityPunct

syn region  pamelaString        start=+'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend
syn region  pamelaString        start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend


"" Conceal
" TODO: These are disabled by some of the rules above
syntax match   concealKeyword "jsx::import"      conceal cchar=◂
syntax match   concealControl "jsx::Component"  conceal cchar=□
syntax match   concealControl "jsx::if"         conceal cchar=╓
syntax match   concealControl "jsx::elif"       conceal cchar=╟
syntax match   concealControl "jsx::else"       conceal cchar=╙
syntax match   concealControl "jsx::value"      conceal cchar=←
syntax match   concealControl "select="         conceal cchar=▶


"-------------------------------------------------

hi def link pamelaBadIndent     Error
hi def link pamelaComment       Comment
hi def link pamelaXSLTag        PreProc
hi def link pamelaNSTag         PreProc
hi def link pamelaTag           Number
hi def link pamelaTemplate      Special
hi def link pamelaInclude       Special
hi def link pamelaUse           Special
hi def link pamelaMacro         Special
hi def link htmlEntity          Number

hi def link pamelaId            Identifier
hi def link pamelaClassSep      Normal
hi def link pamelaClass         Statement
hi def link pamelaClassSpecial  PreProc
hi def link pamelaClassBase     Number
hi def link pamelaLabel         Constant

hi def link pamelaAttributes    Statement
hi def link pamelaAttribute     Statement
hi def link pamelaNSAttribute   PreProc
hi def link pamelaAttributeSpe  PreProc
hi def link pamelaAttributeVal  Constant

hi def link pamelaCommentAnn    Todo
hi def link pamelaString        String

hi  link concealControl   Control
hi! link Conceal          Conceal

setlocal conceallevel=1


" This does not work, I don't know why :/
let b:current_syntax = "pamela"

" EOF
