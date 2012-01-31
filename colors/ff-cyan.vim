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
:	hi normal		guifg=#D0D0D0 guibg=#303030

"Vim syntax
:	hi SpecialKey	guifg=#4A4A4A
:	hi NonText		guifg=#4A4A4A
:	hi LineNr		guifg=#202020 guibg=#3A3A3A
:	hi CursorLine	guifg=#363D40 guibg=#555753
:	hi Folded		guifg=#D0D0D0 guibg=#3A3A3A
:	hi Cursor		guibg=#01a6f3
:	hi Directory	guifg=#008ABD
:	hi Question		guifg=#A09E2E
:	hi Title		guifg=#FFFFFF gui=underline
:	hi Visual		guibg=#606060
:	hi Search		guifg=#E0E0E0 guibg=#427BCF
:	hi IncSearch	guifg=#E0E0E0 guibg=#1469E6
:	hi WildMenu		guifg=#CCCCCC guibg=#1E1F1D
:	hi PMenu		guibg=#222222 guifg=#EEEEEE
:	hi PMenuSel		guibg=#EFEFEF guifg=#111111 gui=bold
:	hi PMenuSbar	guibg=#d7ccca guifg=#d7ccca
:	hi StatusLine	guibg=#707070 guifg=#FFFFFF
:	hi WildMenu		guibg=#41494D guifg=#62A4E8
:	hi MatchParen	guifg=#303030 guibg=#FF43A0

"Code syntax
:	hi Comment		guifg=#D0D0D0 guibg=#3A3A3A
:	hi Todo			guifg=#F0E838 guibg=#635A1D
:	hi Constant		guifg=#4AE6E9
:	hi Special		guifg=#E8E5A9
:	hi Identifier	guifg=#FFFFFF gui=underline
:	hi Statement 	guifg=#FFFFFF gui=bold
:	hi PreProc		guifg=#D01384
:	hi Type			guifg=#E0E0E0 gui=bold
:	hi Number		guifg=#909090

"For the status bar:
" - The RO flag
:	hi User2 term=bold gui=bold ctermfg=red  guifg=#930B58 guibg=black
" - The filename in the statusbar
:	hi User3 term=inverse,bold gui=inverse,bold ctermfg=grey guifg=#808386
" - 3 shades of grey
:	hi User4 term=inverse gui=inverse ctermfg=grey guifg=#606376
:	hi User5 term=inverse gui=inverse ctermfg=grey guifg=#404356
:	hi User6 term=inverse gui=inverse ctermfg=grey guifg=#202336

" For columns
: 	hi ColorColumn term=bold ctermbg=0 guibg=#2A2A2A

" EOF
