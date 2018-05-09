" we need the conceal feature (vim ≥ 7.3)
if !has('conceal')
    finish
endif

" SEE: https://github.com/ehamberg/vim-cute-python/blob/master/after/syntax/python.vim
" SEE: https://alok.github.io/2018/04/26/using-vim-s-conceal-to-make-languages-more-tolerable/
" SEE: https://en.wikipedia.org/wiki/List_of_logic_symbols
syntax match   concealOperator "\<in\>"       conceal cchar=∈
syntax match   concealOperator "\<from\>"     conceal cchar=⊂
syntax match   concealOperator "\<or\>"       conceal cchar=∨
syntax match   concealOperator "\<and\>"      conceal cchar=∧

" include the space after “not” – if present – so that “not a” becomes “¬a”.
" also, don't hide “not” behind  ‘¬’ if it is after “is ”.
syntax match   concealOperator "\%(is \)\@<!\<not\%( \|\>\)" conceal cchar=¬
syntax match   concealOperator "\<not in\>"   conceal cchar=∉
syntax match   concealOperator "<="           conceal cchar=≤
syntax match   concealOperator ">="           conceal cchar=≥
syntax keyword   concealControl for           conceal cchar=∀
syntax keyword   concealControl while         conceal cchar=⥁
syntax keyword   concealControl match         conceal cchar=⇶
syntax keyword   concealControl if            conceal cchar=╓
syntax keyword   concealControl elif          conceal cchar=╟
syntax keyword   concealControl else          conceal cchar=╙
syntax keyword   concealControl return        conceal cchar=❰
syntax keyword   concealControl break         conceal cchar=✖
syntax keyword   concealControl continue      conceal cchar=❱
syntax keyword   concealValue   self          conceal cchar=┄
" TODO: Should match patterns
" syntax match concealValue   "<on"            conceal cchar=↳
" syntax match concealValue   "<do"            conceal cchar=⇨
" syntax match concealValue   "<reduce"        conceal cchar=⪫

syntax match   concealOperator "="           conceal cchar=←
syntax match   concealOperator "=="          conceal cchar==
syntax match   concealOperator "::>"         conceal cchar=⪫
syntax match   concealOperator "::?"         conceal cchar=⩼
syntax match   concealOperator "::="         conceal cchar=⩴
syntax match   concealOperator "->"          conceal cchar=«
syntax keyword  concealOperator is           conceal cchar=≡
syntax match     concealOperator "is not "      conceal cchar=≢
syntax keyword   concealOperator !=           conceal cchar=≠
syntax keyword   concealKeyword  Infinity     conceal cchar=∞
syntax keyword   concealKeyword  None         conceal cchar=∅
syntax keyword   concealKeyword  True         conceal cchar=T
syntax keyword   concealKeyword  False        conceal cchar=F
syntax keyword   concealKeyword  assert       conceal cchar=✅
syntax keyword   concealKeyword  error        conceal cchar=❗
syntax keyword   concealKeyword  pass        conceal cchar=░
syntax match   concealKeyword  "@import"     conceal cchar=◂

syntax match   concealStructure "@module"     conceal cchar=◆
syntax match   concealStructure "@class"      conceal cchar=□
syntax match   concealStructure "@trait"      conceal cchar=⬚
syntax match   concealStructure "@singleton"  conceal cchar=■
syntax match   concealStructure "@function"   conceal cchar=𝝺
syntax match   concealStructure "@constructor" conceal cchar=★
syntax match   concealStructure "@method"     conceal cchar=▸
syntax match   concealStructure "@operation"  conceal cchar=▶
syntax match   concealStructure "@property"   conceal cchar=🞄
syntax match   concealStructure "@shared"     conceal cchar=●
syntax match   concealStructure "@getter"     conceal cchar=◃
syntax match   concealStructure "@setter"     conceal cchar=▹

syntax keyword concealOperator sum        conceal cchar=∑
syntax keyword concealStatement let        conceal cchar=●
syntax keyword concealStatement var        conceal cchar=◌
syntax match   concealOperator "\<sqrt\>" conceal cchar=√
syntax match   concealKeyword "\<\PI\>"   conceal cchar=π

syntax keyword concealStatement lambda conceal cchar=λ

hi  link concealOperator  Operator
hi  link concealStatement Statement
hi  link concealKeyword   Keyword
hi  link concealStructure Structure
hi  link concealControl   Control
hi  link concealValue     Value
hi! link Conceal          Conceal

let b:conceal = "conceal"

setlocal conceallevel=1

" EOF
