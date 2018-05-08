" we need the conceal feature (vim ≥ 7.3)
if !has('conceal')
    finish
endif

" SEE: https://github.com/ehamberg/vim-cute-python/blob/master/after/syntax/python.vim
" SEE: https://alok.github.io/2018/04/26/using-vim-s-conceal-to-make-languages-more-tolerable/
syntax match   concealOperator "\<in\>"       conceal cchar=∈
syntax match   concealOperator "\<or\>"       conceal cchar=∨
syntax match   concealOperator "\<and\>"      conceal cchar=∧

" include the space after “not” – if present – so that “not a” becomes “¬a”.
" also, don't hide “not” behind  ‘¬’ if it is after “is ”.
syntax match   concealOperator "\%(is \)\@<!\<not\%( \|\>\)" conceal cchar=¬
syntax match   concealOperator "\<not in\>"   conceal cchar=∉
syntax match   concealOperator "<="           conceal cchar=≤
syntax match   concealOperator ">="           conceal cchar=≥
syntax match   concealControl "for"           conceal cchar=∀
syntax match   concealControl "while"         conceal cchar=⥁
syntax match   concealControl "match"         conceal cchar=⇶
syntax match   concealControl "if"            conceal cchar=╓
syntax match   concealControl "elif"          conceal cchar=╟
syntax match   concealControl "else"          conceal cchar=╙
syntax match   concealControl "return"        conceal cchar=❰
syntax match   concealControl "break"         conceal cchar=✖
syntax match   concealControl "continue"      conceal cchar=❱
syntax match   concealValue   "self"          conceal cchar=┄

" only conceal “==” if alone, to avoid concealing SCM conflict markers
syntax match   concealOperator "="            conceal cchar=←
syntax match   concealOperator "::>"          conceal cchar=⪫
syntax match   concealOperator "::?"          conceal cchar=⩼
syntax match   concealOperator "::="          conceal cchar=⩴
syntax match   concealOperator "->"           conceal cchar=⇒
syntax match   concealOperator "is"           conceal cchar=≡
syntax match   concealOperator "is not "      conceal cchar=≢
syntax match   concealOperator "!="           conceal cchar=≠
syntax match   concealKeyword  "Infinity"     conceal cchar=∞
syntax match   concealKeyword  "None"         conceal cchar=∅
syntax match   concealKeyword  "True"         conceal cchar=⊤
syntax match   concealKeyword  "False"        conceal cchar=⊥
syntax match   concealKeyword  "assert"       conceal cchar=✅
syntax match   concealKeyword  "error"        conceal cchar=❗
syntax match   concealKeyword  "@import"      conceal cchar=◂

syntax match   concealStructure "@module"     conceal cchar=◆
syntax match   concealStructure "@class"      conceal cchar=□
syntax match   concealStructure "@trait"      conceal cchar=⬚
syntax match   concealStructure "@singleton"  conceal cchar=■
syntax match   concealStructure "@function"   conceal cchar=𝝺
syntax match   concealStructure "@method"     conceal cchar=▸
syntax match   concealStructure "@operation"  conceal cchar=▶
syntax match   concealStructure "@property"   conceal cchar=🞄
syntax match   concealStructure "@shared"     conceal cchar=●
syntax match   concealStructure "@getter"     conceal cchar=◃
syntax match   concealStructure "@setter"     conceal cchar=▹

syntax keyword concealOperator sum        conceal cchar=∑
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
