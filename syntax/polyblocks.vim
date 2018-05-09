" Vim syntax file
" Language:   Polyblocks
" Authors:    Sebastien Pierre <sebastien@ffctn.com>
" Maintainer: Sebastien Pierre <sebastien@ffctn.com>
" Created:    2018-05-08
" Updated:    2018-05-08

" Tag classes, ids, labels
syn match   polyblocksDeclaration   "@[A-Za-z0-9_-]*"       nextgroup=polyblocksData
syn match   polyblocksData          ".+"                    contained 

hi link polyblocksDeclaration Statement
hi link polyblocksData        Constant

" This does not work, I don't know why :/
let b:current_syntax = "polyblocks"

" EOF
