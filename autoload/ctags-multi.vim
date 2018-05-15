" --8<--[CTAGS-MULTI-START]--
" Paste this in your ~/.vimrc to enable TagBar support for ctags-multi
let g:tagbar_type_paml = {
    \ 'ctagsbin'  : 'ctags-multi',
    \ 'sro'       : '.',
    \ 'ctagsargs' : '',
    \ 'scope2kind' : { },
    \ 'kind2scope' : { },
    \ 'kinds' : [ ]
\}
let g:tagbar_type_pcss = {
    \ 'ctagsbin'  : 'ctags-multi',
    \ 'sro'       : '.',
    \ 'ctagsargs' : '',
    \ 'scope2kind' : {
        \ 'module':'M',
        \ 'id':'i',
        \ 'rule':'k' },
    \ 'kind2scope' : {
        \ 'M':'module',
        \ 'i':'id',
        \ 'k':'rule' },
    \ 'kinds' : [
        \ 'M:Class:0:1',
        \ 'i:import:0:1',
        \ 'c:constant:0:1',
        \ 'm:macro:0:1',
        \ 'i:id:0:1',
        \ 'k:rule:0:1',
        \ 'l:subrule:0:1',
        \ 'm:subsubrule:0:1',
        \ 'r:ref:0:1' ]
\}
let g:tagbar_type_sugar = {
    \ 'ctagsbin'  : 'ctags-multi',
    \ 'sro'       : '.',
    \ 'ctagsargs' : '',
    \ 'scope2kind' : {
        \ 'module':'M',
        \ 'class':'C',
        \ 'singleton':'S',
        \ 'trait':'T' },
    \ 'kind2scope' : {
        \ 'M':'module',
        \ 'C':'class',
        \ 'S':'singleton',
        \ 'T':'trait' },
    \ 'kinds' : [
        \ 'M:Class:0:1',
        \ 'C:Class:0:1',
        \ 'S:Singleton:0:1',
        \ 'T:Trait:0:1',
        \ 'f:function:0:1',
        \ 's:shared:0:1',
        \ 'e:enum:0:1',
        \ 'v:event:0:1',
        \ 'a:attribute:0:1',
        \ 'g:getter:0:1',
        \ 'G:setter:0:1',
        \ 'A:shared attribute:0:1',
        \ 'm:method:0:1',
        \ 'o:operation:0:1',
        \ 'c:constructor:0:1' ]
\}
" --8<--[CTAGS-MULTI-END]--
