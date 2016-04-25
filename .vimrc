" ==============================================================================
" Sebastien - vimrc
" Version: 17-Feb-2016 (vim 7.0)
" ==============================================================================

" ------------------------------------------------------------------------------
" M A N U A L
" ------------------------------------------------------------------------------
" Must read:
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
" http://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file " http://stackoverflow.com/questions/2483849/detect-if-a-key-is-bound-to-something-in-vim
" http://stackoverflow.com/questions/3776117/vim-what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-ma
"
" Leader           ,        -- press , and then the following commands
"                  ,w       -- Easy motion jump
"                  ,f       -- Easy Motion search
"                  ,jpp     -- pretty-prints the (currently selected) JSON
"                  ,rv      -- reloads VIM config
" Function keys  
"                  F1       -- NERDtree
"                  F2       -- List buffers
"                  F5       -- Ag
"                  F7       -- Update CTags
"                  F8       -- Toggle TagBar plugin
"                  F9       -- Nobrackets preview

" Bundles (provided by vundle)
" ============================
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" Silver Searcher
" ===============
" :Ag                  - searches using The Silver Searcher
" [normal]    gagiw    - search current word with Ag
"             gagi'    - search current words inside single quotes
" [visual]    gagi     - search selected text


" How to debug a keybiding
" <binding command> <keybinding> :echomsg "Key pressed"<CR>

" ------------------------------------------------------------------------------
" I N I T
" ------------------------------------------------------------------------------

set       nocompatible                " choose no compatibility with legacy vi
syntax    enable
filetype  off

" INSTALLS Vundle, see http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/ 
" Setting up Vundle - the vim plugin bundler
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
let vundle_init=expand('~/.vim/bundle/vundle.initialized')
if !filereadable(vundle_readme)
	echo "Vundle not available, installing it"
	!mkdir -p ~/.vim/bundle
	!git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	!touch ~/.vim/bundle/vundle.initialized
	set rtp+=~/.vim/bundle/vundle/
	echo "Vundle is installed, you can now restard Vim"
	:qa!
endif

" VUNDLE configuration https://github.com/gmarik/vundle#about
set       rtp+=~/.vim/bundle/vundle/
call      vundle#rc()
Bundle    'gmarik/vundle'
" CTags integration
Bundle    'vim-scripts/Tagbar'
" Git integration
Bundle    'tpope/vim-fugitive'
" Vim color scheme in terminal
Bundle    'vim-scripts/CSApprox'
" Fast motion
Bundle    'Lokaltog/vim-easymotion' 
" Nice completion 
Bundle    'ctrlpvim/ctrlp.vim'
" SilverSurfer grep
Bundle    'rking/ag.vim'
" Gag on anything
Bundle    'Chun-Yang/vim-action-ag'
" Useful when switching between screens with different dpi
Bundle    'thinca/vim-fontzoom'
" Displays the buffers in the status line
Bundle    'bling/vim-bufferline'
" Snippets
Bundle    'msanders/snipmate.vim'
" Better file explorer
Bundle    'scrooloose/nerdtree'
" Automatically shows the completion menu
Bundle    'vim-scripts/AutoComplPop'
" Use :Dict <word> to get the definition
Bundle    'szw/vim-dict.git' 
" Automatic bracket/paren/brace insertion
Bundle    'Raimondi/delimitMate'
" Syntastic for error checking & linting
Bundle    'scrooloose/syntastic.git'
" Zeal Documentation Viewer
Bundle    'KabbAmine/zeavim.vim'
" Tabular alignment http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Bundle    'godlygeek/tabular'
" JavaScript Vim mode
Bundle    'pangloss/vim-javascript'
" Pick - https://github.com/thoughtbot/pick.vim/
Bundle    'thoughtbot/pick.vim'
" Snake - https://github.com/amoffat/snake
" Bundle    'amoffat/snake'
" VimProc - https://github.com/Shougo/vimproc.vim
" Bundle    'Shougo/vimproc.vim'
" TypeScript - https://github.com/leafgarland/typescript-vim
Bundle    'leafgarland/typescript-vim'
" TypeScript - https://github.com/Quramy/tsuquyomi
Bundle    'Quramy/tsuquyomi'
" Markify - https://github.com/dhruvasagar/vim-markify
Bundle    'dhruvasagar/vim-markify'
" Sessions - https://github.com/xolox/vim-misc (required by vim-session)
Bundle    'xolox/vim-misc'
" Sessions - https://github.com/xolox/vim-session
Bundle    'xolox/vim-session'
" OpenSCAD - https://github.com/sirtaj/vim-openscad
Bundle    'sirtaj/vim-openscad'
" Multiple Cursors - https://github.com/terryma/vim-multiple-cursors
" Bundle    'terryma/vim-multiple-cursors'
" CSS Colors Cursors - https://github.com/skammer/vim-css-color
Bundle    'skammer/vim-css-color'
" Jedi - https://github.com/davidhalter/jedi-vim
"Bundle    'davidhalter/jedi-vim'
" Bundle    'Valloric/YouCompleteMe'


" I tried `hier`, but it does not list the error on cursor


" Bundles that I've tried and removed
" Bundle    'mileszs/ack.vim'              -- Ag is better
" Bundle    'mattn/emmet-vim'              -- snipmate is much simpler
" Bundle    'rkitover/vimpager'            -- termcaps not displayed
" Bundle    'terryma/vim-smooth-scroll'    -- too slow and weird behavior
" Bundle    'wakatime/vim-wakatime'        -- don't find it useful after all
" Bundle    'mhinz/vim-signify'            -- too slow and inconsistent
" Bundle    'Shougo/neocomplcache.vim'
" Bundle    'ervandew/supertab'            -- I want tab to write a tab, not a cmopletion menu!
" Bundle    'cohama/vim-hier'              -- Does not give the error message
" Bundle    'dannyob/quickfixstatus'       -- Does not load, has an error
" NOTE: Requires 7.3.584, current version is tool old
" Bundle    'git://git.wincent.com/command-t.git'
if filereadable(vundle_init)
	:BundleInstall
	!rm ~/.vim/bundle/vundle.initialized
endif
filetype  plugin indent on             " load file type plugins + indentation

" ------------------------------------------------------------------------------
" B A S I C S
" ------------------------------------------------------------------------------

" FILE FORMATS
set       encoding=utf-8
set       fileformat=unix             " we want to edit in Unix EOL by default
set       fileformats=unix,mac,dos    " when opening a file we will first try Unix, then Mac and finally DOS
" INTERFACE
set       mouse=a                     " enables mouse in terminal
set       scrolloff=3                 " cursor is always 3 lines away from the edge
set       showmode
set       showcmd                     " display incomplete commands
set       showmatch                   " shows matching parenthese"
set       wildmenu
set       wildignore+=*/.hg/*,*/.svn/,build,tiles,Distribution,*/Distribution/,*/build/,*/tiles/,*/.build,*/Build,*/Data,*/data,*/extra,*/extras,*/Cache,*\.class,*\.pyc,*\.png,*\.jpg,*\.gif,*\.tar.gz,*\.tar.bz2,*\.tar.xz,*\.zip

set       visualbell
set       noeb                        " no sound for error message
set       ttyfast
set       nobackup
set       ruler                       " show the cursor position all the time
set       shortmess=filtIoOA          " shorten messages
set       nolazyredraw                " turn off lazy redraw
set       laststatus=2
set       cc=1,4,8,12,80              " columns to highlight"
set       hidden
set       synmaxcol=128               " prevent syntax hilighting on long lines
" EDITING
set       noet                        " Do not expand tabs to spaces
set       nosol                       " Do not place cursor at start of line when moving
set       wrap                        " Wrap lines
set       ek                          " Turn escape on while in insert mode
set       sc                          " Show command
set       autoindent
set       ts=4                        " Tab stops
set       sw=4                        " Shift width
set       bs=2
set       sta                         " Smart tabs
set       paste                       " Paste mode
set       foldmethod=indent           " Folding
set       foldlevel=4
set       nospell                     " Spell off by default, re-activated for specific files only
" SEARCHING
set       hlsearch                    " highlight matches
set       incsearch                   " incremental searching
set       noignorecase                " searches are case sensitive
set       gdefault
set       showmatch
" WHITESPACE
set       list
set       list listchars=tab:»-,trail:·,eol:¬,extends:¬,precedes:¬
let       g:indent_guides_start_level = 1
set       backspace=indent,eol,start  " backspace through everything in insert mode
" CTAGS
set tags=./tags,tags;

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
"
" ------------------------------------------------------------------------------
" C A N D Y
" ------------------------------------------------------------------------------

set statusline=%3*%f%4*\ %5*\ %6*\ %*[%Y%2*%M%R%W%*%{fugitive#statusline()}]\ (%c,\%l)-%v%=%(%p%%\ of\ %L,\ n\ %n%)
" set statusline=%f\ \ \ %*[%Y%2*%M%R%W%*]\ (%c,\%l)-%v%=%(%p%%\ of\ %L,\ n\°%n%)
if has("gui_running")
	set list listchars=tab:»-,trail:·,eol:¬,extends:¬
	set number
	let g:indent_guides_start_level = 2
endif

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
	if exists('b:nostripspace')
		return
	else
		" Preparation: save last search, and cursor position.
		let _s=@/
		let l = line(".")
		let c = col(".")
		" Do the business:
		%s/\s\+$//e
		" Clean up: restore previous search history, and cursor position
		let @/=_s
		call cursor(l, c)
	endif
endfunction

" Setups up wrapping for text files
function s:PresetTextFile()
  set wrap
  set textwidth=79
  set formatoptions=qrn1
  set colorcolumn=80
endfunction
"
syn match     TrailingWhitespace /\s\+$/
syn match     NonASCII           "[^\x00-\x7F]"

" ----------------------------------------------------------------------------
" F I L E  T Y P E S
" ----------------------------------------------------------------------------

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
au BufRead,BufNewFile *.txt call s:PresetTextFile()
" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Configures block commenting for various languages
" Here, pressing on Alt-# will comment or uncomment the current block
autocmd FileType c      noremap <silent> <buffer> <M-#> :call CommentLineToEnd ('// ')<CR>+
autocmd FileType c      noremap <silent> <buffer> <M-#> :call CommentLinePincer('/* ', ' */')<CR>+
autocmd FileType make   noremap <silent> <buffer> <M-#> :call CommentLineToEnd ('# ')<CR>+
autocmd FileType python noremap <silent> <buffer> <M-#> :call CommentLineToEnd ('# ')<CR>+
autocmd FileType pamela noremap <silent> <buffer> <M-#> :call CommentLineToEnd ('# ')<CR>+
autocmd FileType sugar  noremap <silent> <buffer> <M-#> :call CommentLineToEnd ('# ')<CR>+
autocmd FileType html   noremap <silent> <buffer> <M-#> :call CommentLinePincer('<!-- ', ' -->')<CR>+
autocmd FileType c,cpp,java,php,ruby,python,sugar,scala,io,actionscript,objc autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit
autocmd BufNewFile,BufRead *.txt    :setlocal spell spelllang=en
autocmd BufNewFile,BufRead *.paml   :setlocal spell spelllang=en
autocmd BufNewFile,BufRead *.html   :setlocal spell spelllang=en
autocmd BufNewFile,BufRead *.md     :setlocal spell spelllang=en
autocmd BufNewFile,BufRead README   :setlocal spell spelllang=en
autocmd BufNewFile,BufRead CHANGES  :setlocal spell spelllang=en
autocmd BufNewFile,BufRead *.as       set syntax=actionscript
autocmd BufNewFile,BufRead *.kid      set syntax=html
autocmd BufNewFile,BufRead *.m        set syntax=objc
autocmd BufNewFile,BufRead *.io       set syntax=io
autocmd BufNewFile,BufRead *.sjs      set syntax=sugar  ft=sugar        sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.spnuts   set syntax=sugar  ft=sugar        sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.spy      set syntax=sugar  ft=sugar        sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.sas      set syntax=sugar  ft=sugar        sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.sjava    set syntax=sugar  ft=sugar        sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.sg       set syntax=sugar  ft=sugar        sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.py       set syntax=python ft=python       sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.ts       set syntax=typescript ft=typescript       sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.ts.nb    set syntax=typescript ft=typescript  sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.ts.nb    let g:typescript_compiler_binary="nobrackets-wrap tsc"
autocmd BufNewFile,BufRead *.ts.nb    set errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m
autocmd BufNewFile,BufRead *.ts.nb    compiler typescript
autocmd BufWritePost       *.ts.nb    make
autocmd BufNewFile,BufRead *.js       set syntax=typescript ft=typescript       sw=4 ts=4 noet
autocmd BufNewFile,BufRead *.paml     set syntax=pamela.sugar ft=pamela sw=4 ts=4 foldlevel=8 noet
" autocmd BufWritePost       *.ccss     !ffkit-format-ccss <afile>
" autocmd BufWritePost       *.ccss     :checktime
autocmd BufNewFile,BufRead *.ccss     set syntax=clevercss ft=clevercss sw=4 ts=4 foldlevel=8 noet
autocmd BufNewFile,BufRead *.pcss     set syntax=clevercss ft=clevercss sw=4 ts=4 foldlevel=8 noet
autocmd BufNewFile,BufRead *.json     set filetype=json sw=4 ts=4 noet

" Highlights trainling whitespace
" SEE: http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim
autocmd BufWinEnter * match TrailingWhitespace /\s\+$/
autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingWhitespace /\s\+$/
autocmd BufWinEnter * match NonASCII           "[^\x00-\x7F]"
autocmd InsertEnter * match NonASCII           "[^\x00-\x7F]"
autocmd InsertLeave * match NonASCII           "[^\x00-\x7F]"
autocmd BufWinLeave * call clearmatches()

" ------------------------------------------------------------------------------
" K E Y B I N D I N G S
" ------------------------------------------------------------------------------

" Save and Quit as with many other apps
nnoremap <C-S> :w<CR>                   " Saves the buffer
nnoremap <C-Q> :qa<CR>                  " Quits all
nnoremap <C-N> :tabnew<CR>              " Opens a new tab

" Standard Copy/Paste shortcuts
" FROM: http://superuser.com/questions/10588/how-to-make-cut-copy-paste-in-gvim-on-ubuntu-work-with-ctrlx-ctrlc-ctrlv
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
map  <C-a> GVgg
map  <C-t> :tabnew <Enter>
imap <C-v> <C-r><C-o>+

" SEE: http://superuser.com/questions/61226/how-do-i-configure-vim-for-using-ctrl-c-ctrl-v-as-copy-paste-to-and-from-system
" vnoremap <C-c> :echomsg "Copy"<CR>
" inoremap <C-v> :echomsg "Paste"<CR>

" Iterate through buffers using Ctrl+Arrows
nnoremap <M-Up>    :sp<CR>             " Splits the screen
nnoremap <M-Down>  :hide<CR>           " Unsplits the screen
nnoremap <M-Right> :tabnext<CR>        " Switch to tab tab
nnoremap <M-Left>  :tabprevious<CR>    " Switch to previous tab

" Block indent/deindent with Ctrl+D and Ctrl+T or Tab and Shift+Tab where
" available
vnoremap <C-T>   >
vnoremap <C-D>   <LT>
vmap     <Tab>   <C-T>
vmap     <S-Tab> <C-D>

" Folding/Unfolding with using space
nnoremap  <silent>  <space> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>

" And uses Alt plus left and right keys to fold/unfold the current line
 " Opens/closes all fold recursively
nnoremap <C-Down>      zO
nnoremap <C-Up>        zC

" Increase/Decrease fold level globally
nnoremap <C-Left>      zm
nnoremap <C-Right>     zr

" JSON pretty-printing
map <leader>jpp  <Esc>:%!json_xs -f json -t json-pretty<CR>

"" Change the <leader> key
let mapleader = ","

"" no need to <shift> to call `:`
"" nnoremap ; :

" ------------------------------------------------------------------------------
" P L U G I N S
" ------------------------------------------------------------------------------

" Quickly edit/reload the vimrc file
nmap <silent> <leader>rv :e $MYVIMRC<CR>

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

" GIST
" detect filetype if vim failed auto-detection.
" let g:gist_detect_filetype = 1
" " open browser after the post
" let g:gist_open_browser_after_post = 1
" let g:gist_private = 1

let g:tagbar_usearrows      = 1
" let g:tagbar_ctags_bin      = 'ctags-wrapper'
let g:tagbar_type_clevercss = {'ctagstype':'clevercss','kinds':['c:classes']}
let g:tagbar_type_pamela    = {'ctagstype':'pamela','kinds':['c:classes']}
let g:tagbar_type_sugar     = {'ctagstype':'sugar','kinds':['c:classes', 'e:embed', 'g:group', 'o:operations', 'm:methods', 'f:functions', 's:shared', 'p:properties' ]}

" -----------------------------------------------------------------------------
" Project           : nobrackets
" -----------------------------------------------------------------------------
" Author            : Sébastien Pierre              <http://sebastienpierre.ca>
" License           : BSD License
" -----------------------------------------------------------------------------
" Creation date     : 2015-11-06
" Last modification : 2015-11-06
" -----------------------------------------------------------------------------

" An internal variable used to store the state of the preview (only one
" is allowed)
let g:nobrackets_preview_visible = 0

" The main function called. This runs nobrackets and the current buffer
" and shows a preview side by side. Movements in the current buffer
" are synchronized with the preview buffer.
function! NobracketsPreview()
	if g:nobrackets_preview_visible == 1
		" If nobrackets is already visible, we hide it
		let g:nobrackets_preview_visible = 0
		" We clear the insert autocommand from the preview
		augroup robrackets
			au!
		augroup END
		bd! nobrackets
		set noscrollbind | set nocursorbind | set nocursorline | set nocursorcolumn
	else
		" If nobrackets is not already visible, we show it
		" We store the current file
		let g:nobrackets_preview_visible = 1
		let f_format = &fileformat
		let f_type   = &filetype
		let f_path   = @%
		let cursor   = getpos(".")
		" We want to split the buffer vertically so that we have
		" side-by-side comparison
		set splitright
		set scrollbind | set cursorbind | set cursorline | set cursorcolumn
		execute "vnew " . f_path . "+nobrackets"
		" Without silent, the command will ask to press enter
		execute "silent read !nobrackets " . f_path
		" There's an extra blank line at the beginning, we remove it
		normal gg
		normal dd
		set scrollbind | set cursorbind | set cursorline | set cursorcolumn
		" We set the buffer to readonly (it should not be edited)
		" I don't think we can reference variables in commands
		execute "set fileformat=" . f_format
		execute "set filetype="   . f_type
		setlocal nomodifiable
		wincmd h
		" Cursor binding
		" SEE: http://stackoverflow.com/questions/5227964/vim-how-to-scrollbind-the-cursor-line-too
		nmap h h:let curwin=winnr()<CR>:keepjumps windo redraw<CR>:execute curwin . "wincmd w"<CR>
		nmap j j:let curwin=winnr()<CR>:keepjumps windo redraw<CR>:execute curwin . "wincmd w"<CR>
		nmap k k:let curwin=winnr()<CR>:keepjumps windo redraw<CR>:execute curwin . "wincmd w"<CR>
		nmap l l:let curwin=winnr()<CR>:keepjumps windo redraw<CR>:execute curwin . "wincmd w"<CR>
		" We close the preview once we're in insert mode
		augroup robrackets
			au InsertEnter * windo call NobracketsPreview()
		augroup END
		" We set the cursor where it was and redraw the windows
		call setpos('.', cursor)
		let  curwin=winnr()
		keepjumps windo redraw 
		execute curwin . "wincmd w"
	endif
endfunction

" TaskList, <leader>t
" let g:tlTokenList = ['FIXME', 'TODO', 'NOTE', 'OPTIMIZE']

" We force terminal to 256 colors, see http://vim.wikia.com/wiki/Using_GUI_color_settings_in_a_terminal
set t_Co=256
" Default color scheme
colorscheme ff-cyan

" NOTE: I was using Ctrl-P and am now using Command-T
" ctrlp.vim configuration
nmap     <silent> <leader>b  :CtrlPBuffer<CR>
nmap     <silent> <leader>r  :CtrlPMRU<CR>
nmap     <silent> <leader>o  :CtrlPCurWD<CR>
nnoremap <S-Space>           :CtrlPTag<CR>
nmap     <C-Space>           :CtrlPCurWD<CR>
let g:ctrlp_map = '<leader>p' " mapping to invoke |CtrlP| in |Normal| mode
let g:ctrlp_working_path_mode = 1  " 2 - the nearest ancestor that contains one of these directories or files:
let g:ctrlp_max_height        = 20 " maximum height of the match window
let g:ctrlp_dotfiles          = 0  " don’t want to search for dotfiles and dotdirs
let g:ctrlp_custom_ignore     = {
\ 'dir':  '\.git$\|\.hg$\|\.svn$\|db/sphinx/*\|\.build$\|build$\|Build$\|\.cache$\|cache$\|Cache$\|Data$\|Distribution$\|Dist$|deps$', 
\ 'file': '\.log$\|\.pid$\|\.png$\|\.jpg$\|\.gif$\|\.class$\|\.pyc$\|\.tar.gz$|\.tar.bz2$'
\ }
" nmap     <C-Space>           :CtrlP<CR>

" Command-T
" See: http://git.wincent.com/command-t.git/blob_plain/HEAD:/doc/command-t.txt
" nmap     <C-Space>           :CommandT<CR>

" EasyMotion -- https://github.com/Lokaltog/vim-easymotion
let g:EasyMotion_leader_key = '<leader>'
"
" NeoComplete Cache
let g:neocomplcache_enable_at_startup = 1

" Syntastic
let g:syntastic_typescript_checkers = ["nobrackets-wrap"]

" Session
let g:session_autosave='no'

" Vim-action-ae 
" "use  * to search current word in normal mode
" nmap * <Plug>AgActionWord
" " use * to search selected text in visual mode
" vmap * <Plug>AgActionVisual

" Multiple Cursors
set selection=inclusive

" Smooth scrolling (this overrides the visual)
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 1)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 1)<CR>

" Function keys
map  <F1> :NERDTree<CR>
map  <F2> :buffers<CR>
map  <F5> :Ag
"map  <F7> :!/usr/bin/ctags -R . && /usr/bin/env ctags-sugar -Ra .<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :call NobracketsPreview()<CR>

" EOF
