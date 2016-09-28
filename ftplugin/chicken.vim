" SEE: http://wiki.call-cc.org/vim#completion
let b:is_chicken=1
setl complete+=,k~/Local/bin/chicken-word-list
setl include=\^\(\\(use\\\|require-extension\\)\\s\\+
setl includeexpr=substitute(v:fname,'$','.scm','')
setl path+=~/.chicken/eggs
setl suffixesadd=.scm
setl lispwords+=let-values,condition-case,with-input-from-string
setl lispwords+=with-output-to-string,handle-exceptions,call/cc,rec,receive
setl lispwords+=call-with-output-file

nmap <silent> == :call Scheme_indent_top_sexp()<cr>

" Indent a toplevel sexp.
fun! Scheme_indent_top_sexp()
	let pos = getpos('.')
	silent! exec "normal! 99[(=%"
	call setpos('.', pos)
endfun

" Does not work
" au VimEnter * :RainbowParenthesesLoadRound()
