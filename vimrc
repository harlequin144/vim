set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has('win32') || has('win64')
    set rtp+=~/vimfiles/bundle/Vundle.vim/
    call vundle#rc('$HOME/vimfiles/bundle/')
else
    " Usual quickstart instructions
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
endif

call vundle#begin()



" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}


" Color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'https://github.com/hhsnopek/vim-firewatch.git'
Plugin 'https://github.com/juanedi/predawn.vim.git'


Plugin 'unblevable/quick-scope'
Plugin 'Chiel92/vim-autoformat'
" Plugin 'Valloric/YouCompleteMe'

Plugin 'godlygeek/tabular' " This must come before vim-markdown!!!
Plugin 'plasticboy/vim-markdown'
Plugin 'ctrlpvim/ctrlp.vim'



" All of your Plugins must be added before the following line
call vundle#end()            " required by Vundle
filetype plugin indent on    " required by Vundle

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Autoformat Settings
map <Leader>f  :Autoformat<CR>
let g:autoformat_verbosemode = 1

let g:formatdef_my_custom_python = '"python -m autopep8 - --aggressive --aggressive"'
let g:formatters_python = ['my_custom_python']

let g:formatdef_my_custom_cs = '"astyle --mode=cs --style=allman --indent-namespaces --indent-switches --add-brackets --min-conditional-indent=1 --max-code-length=100"'
let g:formatters_cs = ['my_custom_cs']


" Ctrlp Settings 
" let g:ctrlp_map = '<c-q>'
map <Leader>o  :CtrlPMixed<CR>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }

" Ignore files in .gitignore
"  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" General

syntax enable
set background=dark " dark | light
colorscheme predawn

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
set relativenumber
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
