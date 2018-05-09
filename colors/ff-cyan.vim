" Vim color file
"
" Author: Sébastien Pierre <sebastien.pierre@gmail.com>
"
hi clear
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="ff-cyan"
"
"Text
:	hi normal		guifg=#D0D0D0 guibg=#2A2A2A

"Vim syntax
:	hi SpecialKey	guifg=#4A4A4A
:	hi NonText		guifg=#4A4A4A
:	hi LineNr		guifg=#202020 guibg=#3A3A3A
:	hi CursorLine	guibg=#19464B
:	hi CursorLineNr	guifg=#202020 guibg=#1EC9DF
:	hi Visual		guibg=#19464B
:	hi Folded		guifg=#808080 guibg=#202020
:	hi Cursor		guibg=#01a6f3
:	hi Directory	guifg=#008ABD
:	hi Question		guifg=#A09E2E
:	hi Title		guifg=#FFFFFF gui=underline
:	hi Search		guifg=#E0E0E0 guibg=#427BCF
:	hi IncSearch	guifg=#E0E0E0 guibg=#1469E6
:	hi WildMenu		guifg=#CCCCCC guibg=#1E1F1D
:	hi PMenu		guibg=#222222 guifg=#EEEEEE
:	hi PMenuSel		guibg=#EFEFEF guifg=#111111 gui=bold
:	hi PMenuSbar	guibg=#d7ccca guifg=#d7ccca
":	hi StatusLine	guibg=#707070 guifg=#FFFFFF
:	hi StatusLine	guibg=#116B7A guifg=#7FCBD7
:	hi StatusLineNC	guibg=#116B7A guifg=#3E7A84
:	hi VertSplit	guibg=#116B7A guifg=#5E5E5E
:	hi WildMenu		guibg=#41494D guifg=#62A4E8
:	hi MatchParen	guifg=#01a6f3 guibg=#105E6E

"Code syntax
:	hi Comment		guifg=#909090 guibg=#3A3A3A
:	hi Todo			guifg=#F0E838 guibg=#635A1D
:	hi Constant		guifg=#4AE6E9
:	hi Special		guifg=#E8E5A9
:	hi Identifier	guifg=#FFFFFF gui=underline
:	hi link         Value     Identifier
:	hi link         Control   Statement
:	hi Statement 	guifg=#FFFFFF gui=bold
:	hi PreProc		guifg=#D01384
:	hi Type			guifg=#E0E0E0 gui=bold
:	hi Number		guifg=#909090
:	hi TrailingWhitespace		guibg=#881300 guifg=#CE1A2C
:	hi NonASCII		guibg=#1C3341 guifg=#DCF4F8

" Conceal
:	hi Conceal				guifg=#FFE21B guibg=#2A2A2A
:	hi ConcealStatement		guifg=#FFE21B guibg=#2A2A2A
:	hi ConcealStructure		guifg=#FFE21B gui=bold guibg=#2A2A2A
:	hi ConcealKeyword		guifg=#FFE21B guibg=#2A2A2A
:	hi ConcealOperator		guifg=#FFFFFF gui=bold guibg=#2A2A2A

"Diff syntax
:hi DiffAdd         guifg=#22AEEA guibg=#2F415C
:hi DiffChange                    guibg=#5C2F57
:hi DiffDelete      guifg=#656565 guibg=#1C1C1C
:hi DiffText                      guibg=#AE3838

"TagBar syntax
:hi clear TagbarKind
:hi TagbarKind		guifg=#2A7679


"For the status bar:
" - The RO flag
:	hi User2 term=bold gui=bold ctermfg=red  guifg=#930B58 guibg=black
" - The filename in the statusbar
:	hi User3 term=inverse,bold gui=inverse,bold ctermfg=grey guifg=#1EC9DF
" - 3 shades of grey
:	hi User4 term=inverse gui=inverse ctermfg=grey guifg=#2EC7DC
:	hi User5 term=inverse gui=inverse ctermfg=grey guifg=#4EC0D0
:	hi User6 term=inverse gui=inverse ctermfg=grey guifg=#67C4D2

" For columns
: 	hi ColorColumn term=bold ctermbg=0 guibg=#282828

" EOF
