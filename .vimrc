" ==============================================================================
" Sebastien - vimrc
" Version: 31-Jan-2012 (vim 7.0)
" ==============================================================================

" ------------------------------------------------------------------------------
" I N I T
" ------------------------------------------------------------------------------

set       nocompatible                " choose no compatibility with legacy vi
set       modelines=0
syntax    enable
filetype  off
call      pathogen#infect()
filetype  plugin indent on             " load file type plugins + indentation

" ------------------------------------------------------------------------------
" B A S I C S
" ------------------------------------------------------------------------------

" FILE FORMATS
set       encoding=utf-8
set       fileformat=unix             " we want to edit in Unix EOL by default
set       fileformats=unix,mac,dos    " when opening a file we will first try Unix, then Mac and finally DOS
" INTERFACE
set       scrolloff=3
set       showmode
set       showcmd                     " display incomplete commands
set       showmatch                   " shows matching parenthese"
set       wildmenu
set       wildmode=list:longest
set       visualbell
set       noeb                        " no sound for error message
set       ttyfast
set       nobackup
set       number
set       ruler                       " show the cursor position all the time
set       shortmess=filtIoOA          " shorten messages
set       nolazyredraw                " turn off lazy redraw
set       laststatus=2
set       cc=1,4,8,12,80              " columns to highlight"
set       hidden
" EDITING
set       noeb                        " No ringing bell for errors
set       noet                        " Do not expand tabs to spaces
set       nosol                       " Do not place cursor at start of line when moving
set       nowrap                      " Do not wrap lines
set       ek                          " Turn escape on while in insert mode
set       sc                          " Show command
set       autoindent
set       textwidth=80
set       ts=4                        " Tab stops
set       sw=4                        " Shift width
set       bs=2
set       sta                         " Smart tabs
set       paste                       " Paste mode
set       foldmethod=syntax           " Folding
" SEARCHING
set       hlsearch                    " highlight matches
set       incsearch                   " incremental searching
set       ignorecase                  " searches are case insensitive...
set       smartcase                   " ... unless they contain at least one capital letter
set       gdefault
set       showmatch
" WHITESPACE
set       tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set       list
set       list listchars=tab:»-,trail:·,eol:¬,extends:¬,precedes:¬
let       g:indent_guides_start_level = 1
set       backspace=indent,eol,start  " backspace through everything in insert mode
" UNDO
try
  " persistent undo
  set undodir=~/.vim/tmp
  set undofile
catch /Unknown option/
  " For versions of Vim prior to 7.3.
endtry

let g:SuperTabCrMapping = 0

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers

" ------------------------------------------------------------------------------
" F U N C T I O N S
" ------------------------------------------------------------------------------

"" Strip whitespaces from the current file
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

" Automatically Strip trailing whitespace on save
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Setups up wrapping for text files
function s:setupWrapping()
  set wrap
  set textwidth=79
  set formatoptions=qrn1
  set colorcolumn=85
endfunction
"
" ----------------------------------------------------------------------------
" F I L E  T Y P E S
" ----------------------------------------------------------------------------

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
au BufRead,BufNewFile *.txt call s:setupWrapping()
" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Configures block commenting for various languages
" Here, pressing on Alt-# will comment or uncomment the current block
autocmd FileType c      noremap <silent> <buffer> <M-#> :call CommentLineToEnd ('// ')<CR>+
autocmd FileType c      noremap <silent> <buffer> <M-#> :call CommentLinePincer('/* ', ' */')<CR>+
autocmd FileType make   noremap <silent> <buffer> <M-#> :call CommentLineToEnd ('# ')<CR>+
autocmd FileType python noremap <silent> <buffer> <M-#> :call CommentLineToEnd ('# ')<CR>+
autocmd FileType html   noremap <silent> <buffer> <M-#> :call CommentLinePincer('<!-- ', ' -->')<CR>+
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit
autocmd BufNewFile,BufRead *.txt    :setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead README   :setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead CHANGES  :setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.as       set syntax=actionscript
autocmd BufNewFile,BufRead *html.tmpl set syntax=html
autocmd BufNewFile,BufRead *kid       set syntax=html
autocmd BufNewFile,BufRead *.m        set syntax=objc
autocmd BufNewFile,BufRead *.io       set syntax=io
autocmd BufNewFile,BufRead *.sjs      set syntax=sugar sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.spnuts   set syntax=sugar sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.spy      set syntax=sugar sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.sas      set syntax=sugar sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.sjava    set syntax=sugar sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.sg       set syntax=sugar sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.paml     set syntax=pamela sw=4 ts=4 foldlevel=8 noet
autocmd BufNewFile,BufRead *.json     set filetype=json sw=4 ts=4 noet

" ------------------------------------------------------------------------------
" K E Y B I N D I N G S
" ------------------------------------------------------------------------------
" Useful: http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)

" Save and Quit as with many other apps
nnoremap <C-S> :w<CR>                   " Saves the buffer
nnoremap <C-Q> :wqa<CR>                 " Quits vim and saves all
nnoremap <M-N> :tabnew                  " Opens a new tab
nnoremap <M-W> :tabclose                " Closes the current tab
nnoremap <C-E> :VSTreeExplore<CR>       " Opens the file explorer
"
" Command-T
nmap     <silent> <C-o> :CommandT<CR>
" nnoremap <C-o> :FufFile **/<CR>

" Iterate through buffers using Ctrl+Arrows
nnoremap <C-Right> :bn<CR>             " Switch to nextbuffer
nnoremap <C-Left>  :bp<CR>             " Switch to previous buffer
nnoremap <C-Up>    :sp<CR>             " Splits the screen
nnoremap <C-Down>  :bd<CR>             " Unsplits the screen

" Disable help key
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" Block indent/deindent with Ctrl+D and Ctrl+T or Tab and Shift+Tab where
" available
vnoremap <C-T>    >
vnoremap <C-D>   <LT>
vmap     <Tab>   <C-T>
vmap     <S-Tab> <C-D>

" Folding/Unfolding with using space
nnoremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>

" And uses Alt plus left and right keys to fold/unfold the current line
 " Opens/closes all fold recursively
nnoremap <M-Down>      zO
nnoremap <M-Up>        zC

" Increase/Decrease fold level globally
nnoremap <M-Left>      zm
nnoremap <M-Right>     zr

" JSON pretty-printing
map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>

"" Change the <leader> key
" http://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file
" -END OF FILE-
let mapleader = ","

"" no need to <shift> to call `:`
"" nnoremap ; :

" ------------------------------------------------------------------------------
" P L U G I N S
" ------------------------------------------------------------------------------

" ZoomWin configuration
map <Leader>z :ZoomWin<CR>

"" Gundo plugin shortcut
nnoremap <F5> :GundoToggle<CR>
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>

"" Gist setup
if executable("pbcopy")
  " The copy command
  let g:gist_clip_command = 'pbcopy'
elseif executable("xclip")
  " The copy command
  let g:gist_clip_command = 'xclip -selection clipboard'
elseif executable("putclip")
  " The copy command
  let g:gist_clip_command = 'putclip'
end

" detect filetype if vim failed auto-detection.
let g:gist_detect_filetype = 1
" open browser after the post
let g:gist_open_browser_after_post = 1
let g:gist_private = 1

" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_usearrows = 1

" TaskList, <leader>t
let g:tlTokenList = ['FIXME', 'TODO', 'NOTE', 'OPTIMIZE']

" Default color scheme
colorscheme ff-cyan

" coffeetags -R -f TAGS
let g:tagbar_type_coffee = {
\ 'kinds' : [
\   'f:functions',
\   'o:object'
\ ],
\ 'kind2scope' : {
\  'f' : 'object',
\   'o' : 'object'
\},
\ 'sro' : ".",
\ 'ctagsbin' : 'coffeetags',
\ 'ctagsargs' : ' ',
\}

" ctrlp.vim configuration
let g:ctrlp_map = '<leader>f' " mapping to invoke |CtrlP| in |Normal| mode
let g:ctrlp_working_path_mode = 2
let g:ctrlp_max_height = 20 " maximum height of the match window
let g:ctrlp_dotfiles = 0 " don’t want to search for dotfiles and dotdirs
" let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|db/sphinx/*',
      \ 'file': '\.log$\|\.pid$',
      \ }
" EOF
