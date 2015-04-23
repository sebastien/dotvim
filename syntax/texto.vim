" Vim syntax file
" Language:   Texto
" Maintainer: Sébastien Pierre <sebastien.pierre@gmail.com>
" Updated:    2014-06-09

syn match  textoComment			"^#.*$"
syn match  textoTitle			"^== [^=]\+.\+$"
syn match  textoSubTitle		/^-- .*$/
syn match  textoPreformatted	/\s*>\(\t\|   \).*/
syn match  textoBold			/\*.*\*/
syn match  textoCode			/`.*`/
syn region textoCodeBlock		start=+```+ end=+```+
syn match  textoKeyword			/_.*_/
syn match  textoLink			/\[.*\]\s*([^\)]*)/
syn match  textoReference		/\[.*\]\s*([^\]]*)/
syn match  textoURL  			/<\w+:\/\/[^>]+>/
syn region textoListItem		start=/^\s*\(-\|\a)\|\d)\)/ end=/$/ contains=textoKeyword,textoLink,textoReference,textoCode,textoBold,textoURL
syn match  textDefinitionItem	/^.+::$/                       contains=textoKeyword,textoLink,textoReference,textoCode,textoBold,textoURL

syn match textoSectionSingle	/^\(\d\.\)+\d?.*$/
syn match textoSectionMulti 	/^.*\n\(=\+\|-\+\)$/

hi def link textoTitle			Special
hi def link textoSectionSingle	Special
hi def link textoSectionMulti	Special

hi def link textoComment		Comment

hi def link textoKeyword		Statement

hi def link textoListItem		Special
hi def link textoDefinitionItem	Special

hi def link textoLink			Function
hi def link textoReference		Function
hi def link textoURL			Function
hi def link textoEmail			Function

hi def link textoPreformatted	String
hi def link textoCode			String
hi def link textoBold			String
hi def link textoCodeBlock		String

