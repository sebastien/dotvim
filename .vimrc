set nocompatible                " choose no compatibility with legacy vi
set modelines=0
syntax enable
set encoding=utf-8
filetype off
call pathogen#infect()
filetype plugin indent on       " load file type plugins + indentation

set scrolloff=3
set autoindent
set showmode
set showcmd                     " display incomplete commands
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set number
set ruler                       " show the cursor position all the time
set shortmess=filtIoOA          " shorten messages
set nolazyredraw                " turn off lazy redraw

set laststatus=2

try
  " persistent undo
  set undodir=~/.vim/tmp
  set undofile
  " Highlight 81 column
  set textwidth=80
  set colorcolumn=+1
catch /Unknown option/
  " For versions of Vim prior to 7.3.
endtry

let g:LustyJugglerSuppressRubyWarning = 1
let g:SuperTabCrMapping = 0

"" Statusline
let g:statline_fugitive = 1
let g:statline_rvm = 0
let g:statline_show_n_buffers = 0

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set list
set listchars=tab:▸\ ,eol:¬
set backspace=indent,eol,start  " backspace through everything in insert mode
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

"" Formatting
" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript
au BufRead,BufNewFile *.txt call s:setupWrapping()

function s:setupWrapping()
  set wrap
  set textwidth=79
  set formatoptions=qrn1
  set colorcolumn=85
endfunction

"" Textmate style key mappings for indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

"" Change the <leader> key
let mapleader = ","

"" no need to <shift> to call `:`
nnoremap ; :

"" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault
set showmatch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Command-T Configuration
let g:CommandTMaxHeight=20

" map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

"" Windows & Navigation
" open a new vertical split window and switchto it
nnoremap <leader>w <C-w>v<C-w>l

" ZoomWin configuration
map <Leader>z :ZoomWin<CR>

" switch between the currently open buffer and the
" previous one
nnoremap <leader><leader> <c-^>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" disable cursor keys in normal mode
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

" double percentage sign in command mode is expanded
" " to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>et :tabe %%

"" gundo plugin shortcut
nnoremap <F5> :GundoToggle<CR>

"" look here for tags generated from Gemfile.lock
set tags+=gems.tags

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

" TaskList, <leader>t
let g:tlTokenList = ['FIXME', 'TODO', 'NOTE', 'OPTIMIZE']

" Default color scheme
colorscheme desert
set background=dark

if has("gui_running")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif

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
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
