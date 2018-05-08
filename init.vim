"
" source $HOME/.vimrc
" 
" " NeoVIM
" Bundle    'equalsraf/neovim-gui-shim'
" 
" 
" let g:completor_auto_trigger = 1
" Bundle 'Shougo/deoplete.nvim'
" Bundle 'SirVer/ultisnips'
" let g:deoplete#enable_at_startup = 1
" 
" inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"
"
" ==========================================================
"
" call plug#begin()
" " (Optional) Multi-entry selection UI.
" Plug 'junegunn/fzf'
" 
" " completion manager
" Plug 'roxma/nvim-completion-manager'
" 
" call plug#end()
" ============
call plug#begin('~/.config/nvim/minimal-plugged')

Plug 'Shougo/deoplete.nvim'

call plug#end()

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#file#enable_buffer_path = 1
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone,preview,noinsert
