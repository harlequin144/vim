syntax enable
set background=dark
colorscheme solarized

" This facilitates keeping vim-pathogen in the bundle dir per the recommendation
" in vim-pathogen's faq.
" runtime bundle/vim-pathogen/autoload/pathogen.vim

"enabling pathogen and solarized
" set t_Co=16
" execute pathogen#infect()
" syntax on
" set background=dark " dark | light "
" colorscheme solarized

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on



" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" set nocompatible


set title " This gives e.g. | page.html (~) - VIM |.

set tw=80

" set ls=2

set smartcase
set ignorecase
set incsearch		" do incremental searching
set cursorline          " highlight current line and column 80 
set colorcolumn=80      
set scrolloff=3         " start scrolling three lines before the border
set showmatch		" Show matching brackets.
set history=50		" keep 50 lines of command line history
set number
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set smartindent
set autoindent
set tabstop=8 
set expandtab 
set shiftwidth=4 
set softtabstop=4

imap jk <esc>
imap kj <esc>
imap jj <esc>
imap kk <esc>

set fillchars="fold: "  
set foldmethod=marker   " This is currently set for cobol purposes.     
set foldtext="+"        " change what is displayed at a fold.

" This allows you to move past a fold without opening it.
set foldopen="hor,mark,percent,quickfix,search,tag,undo"

set backspace=indent,eol,start


" Almost all the time the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


command! -bar -nargs=* -range=% Interleave :<line1>,<line2>call Interleave(<f-args>)
fun! Interleave(...) range
  if a:0 == 0
    let x = 1
    let y = 1
  elseif a:0 == 1
    let x = a:1
    let y = a:1
  elseif a:0 == 2
    let x = a:1
    let y = a:2
  elseif a:0 > 2
    echohl WarningMsg
    echo "Argument Error: can have at most 2 arguments"
    echohl None
    return
  endif
  let i = a:firstline + x - 1
  let total = a:lastline - a:firstline + 1
  let j = total / (x + y) * x + a:firstline
  while j < a:lastline
    let range = y > 1 ? j . ',' . (j+y) : j
    silent exe range . 'move ' . i
    let i += y + x
    let j += y
  endwhile
endfun

" " Convenient command to see the difference between the current buffer and the
" " file it was loaded from, thus the changes you made.
" " Only define it when not defined already.
" if !exists(":DiffOrig")
    " command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		   " \ | wincmd p | diffthis
" endif



" The following is taken from
" http://stackoverflow.com/questions/4331776/
" change-vim-swap-backup-undo-file-name




" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/vimfiles/backup') == 0
  :silent !mkdir -p ~/vimfiles/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/vimfiles/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/vimfiles/swap') == 0
  :silent !mkdir -p ~/vimfiles/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/vimfiles/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/vimfiles/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/vimfiles/undo') == 0
    :silent !mkdir -p ~/vimfiles/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/vimfiles/undo//
  set undofile
endif
