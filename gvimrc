" Set the font when in 
if has("gui_running")
  if has("gui_gtk2")
    " set guifont=Inconsolata\ 12
    set guifont=Hack\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Hack:h11:cANSI
  endif
endif

au GUIEnter * simalt ~x
