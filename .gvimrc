colorscheme vwilight
" big fonts are good for RSI
set guifont=Monaco:h14

set linespace=2
set cursorline
set antialias

" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
end
