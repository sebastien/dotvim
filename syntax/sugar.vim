" Vim syntax file
" Language:   Sugar (http://github.com/sebastien/sugar)
" Maintainer: Sébastien Pierre <sebastien.pierre@gmail.com>
" Created:    2007-04-03
" Updated:    2014-09-23

syn match   sugarComment        "^\s*#.*$" contains=sugarCommentAnn
syn match   sugarCommentAnn     /\v(TODO|NOTE|FIXME|BUG|DEBUG|SEE|WARNING|EOF)/ contained
syn match   sugarAnchor         "\[[A-Z_]+\]" contained
syn match   sugarDocumentation  "^\s*|.*$" contains=sugarDocRef,sugarDocCode,sugarDocExample skipwhite
syn match   sugarDocRef         /@[a-zA-Z_][a-zA-Z0-9_]*/ contained
syn match   sugarDocCode        /\v'[^']+'*/ contained
syn match   sugarDocExample     /\v\>\s+.*/ contained
syn match   sugarBadIndent      /\v\t*[ ]+\t+/

syn match   sugarDeclaration    /\v\@(singleton|trait|class|shared|property|group|embed|end)/ nextgroup=sugarDeclName skipwhite
syn match   sugarFunction       /\v(\@abstract\s+)?\@(function|constructor|accessor|mutator|destructor|main|method|operation)/ nextgroup=sugarFunctionName skipwhite
syn match   sugarConstructor    /\v\@(constructor)/ nextgroup=sugarFunctionArgs skipwhite
syn match   sugarFunctionName   /\<[a-zA-Z_][a-zA-Z0-9_]*\>/  nextgroup=sugarFunctionArgs contained skipwhite
syn match   sugarFunctionArgs   ".*$" contained contains=sugarDeclName
syn match   sugarMeta           /\v\@(module|import|feature|version|requires|authors|target)/ nextgroup=sugarMetaRest skipwhite
syn match   sugarAnnotation     /\v\@(as|when|where|example)/ nextgroup=sugarMetaRest skipwhite
syn match   sugarMetaRest       /\v.+/ contained
syn region  sugarArray          start=+\[+ end=+\]+
syn match   sugarKey            /\v[a-zA-Z_][a-zA-Z0-9_]*\s*\:/
syn keyword sugarControl        for if elif while match else
syn match   sugarComputation    /\v(\+|\-|\/|\^|\%)/ 
syn match   sugarOperator       /\v(not|is|is\?|is not|not in|in|\-\>|\.\.|\:\:[\?\>\<\=]?|\=)/ 
syn match   sugarDelimiter      /\v(\(|\)|\[|\]|\{|\}|\:)/ 
syn match   sugarLogic          /\v(and|or|not|\!\=|\=\=|\<|\>|\>\=|\<\=)/ 
syn match   sugarInteger        /[0-9]+/
syn match   sugarFloat          /[0-9]+.[0-9]+/
syn keyword sugarValues         Undefined None Any True False
syn match   sugarName           /\<[a-zA-Z_][a-zA-Z0-9_]*\>/ 
syn match   sugarDeclName       /[a-zA-Z_][a-zA-Z0-9_]*/  nextgroup=sugarDeclType contained
syn match   sugarDeclType       /:[a-zA-Z_][a-zA-Z0-9_]*/ nextgroup=sugarDeclType contained
syn match   sugarConstant       /\<[A-Z][A-Z0-9_]\+\>/ 

syn keyword sugarAllocation     var let nextgroup=sugarDeclName skipwhite
syn keyword sugarStatement      return new self super

syn region  sugarSQString     start=+'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend
syn region  sugarDQString     start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend

hi def link sugarBadIndent      Error
hi def link sugarComment        Comment
hi def link sugarCommentAnn     Todo
hi def link sugarAnchor         Todo
hi def link sugarDocumentation  String
hi def link sugarDocRef         String
hi def link sugarDocCode        String
hi def link sugarDocExample     Statement
hi def link sugarDeclaration    Statement
hi def link sugarConstructor    Statement
hi def link sugarFunction       Statement
hi def link sugarFunctionName   Identifier
hi def link sugarFunctionArgs   Identifier
hi def link sugarDeclName       Identifier
hi def link sugarDeclType       Type
hi def link sugarName           Normal
hi def link sugarConstant       Constant
hi def link sugarStructure      Function
hi def link sugarMeta           Special
hi def link sugarAnnotation     Special
hi def link sugarMetaRest       Statement
hi def link sugarArray          Special
hi def link sugarKey            Identifier
hi def link sugarControl        Conditional
hi def link sugarOperator       Conditional
hi def link sugarDelimiter      Special
hi def link sugarComputation    Special
hi def link sugarLogic          Special
hi def link sugarAllocation     Statement
hi def link sugarStatement      Statement
hi def link sugarSQString       String
hi def link sugarDQString       String
hi def link sugarInteger        Number
hi def link sugarFloat          Float
hi def link sugarValues         String

" This does not work, I don't know why :/
let b:current_syntax = "sugar"

" EOF
