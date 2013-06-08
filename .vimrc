set mouse=a
set number

"-----------------------------------------------------------------------------
" Haskell
"-----------------------------------------------------------------------------
let g:haddock_browser="/usr/bin/firefox"
let maplocalleader = "_"

"-----------------------------------------------------------------------------
" Vundle
"-----------------------------------------------------------------------------
source ~/.vundlebundles

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------
" Necessary to show unicode glyphs
set encoding=utf-8

" Colorscheme
colorscheme xoria256

filetype detect

" Better command-line completion
set wildmenu
" shell style completion
" set wildmode=list:longest

" disable using alt modifier for accessing window menus
set winaltkeys=no

" smarter searching. ignores case if all letters same case
set ignorecase 
set smartcase
set incsearch

" remap leader
let mapleader = ","

" sets the title of the shell to the curretly opened file
set title

" most of the time wrapping is annoying
set nowrap

" if we do wrap, split on words rather than characters
set linebreak

" cursor position
set ruler

" Show partial commands in the last line of the screen
set showcmd

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Set the status line the way i like it (disabled now because of powerline)
" set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Toggle between 'paste' and 'nopaste' using F2
set pastetoggle=<F2>

" Highlight when searching
set hlsearch

" enable omnicompletion
set ofu=syntaxcomplete#Complete

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <leader>hc :nohl<CR><C-L>

" keep longer history
set history=1000

" enable extended % matching
runtime macros/matchit.vim

syntax on
set hidden
set showmatch

" Automatic folding
set foldmethod=syntax
set foldnestmax=2

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------------------------------------------------------
" Tag preferences
"-----------------------------------------------------------------------------
set tags=./tags;/
" Show list of possible tags if more than one,
" otherwise jump directly
nnoremap <C-]> g<C-]>

" Use Ctrl-space Ctrl-space to look up usage using cscope
nmap <C-@><C-@> :cs find s <C-R>=expand("<cword>")<CR><CR>

"-----------------------------------------------------------------------------
" Movement preferences
"-----------------------------------------------------------------------------
" Window movement command mapping
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Keep selection after indenting
vnoremap > >gv
vnoremap < <gv

" Movement default gj and gk
nnoremap j gj
nnoremap k gk

" slightly faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" scroll with the cursor if its within 3 lines of the edge
set scrolloff=3

" swap tilde and apostrophe, for better mark navigation
nnoremap ' `
nnoremap ` '

" Virtual Editing mode 
set virtualedit=block

"-----------------------------------------------------------------------------
" Indentation
"-----------------------------------------------------------------------------
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
filetype indent plugin on

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

"-----------------------------------------------------------------------------
" Custom mappings for plugins
"-----------------------------------------------------------------------------

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" opens nerd tree in project root dir
map <F6> :ToggleNERDTree<CR>
map <F7> :TlistToggle<CR>

" Switch between complementary filetypes
" mnemonic: Go Switch
nnoremap gs :A<CR>

" Find Uses
nmap <leader>fu yiw:vimgrep /"/ ./**/*.c
vmap <leader>fu y:vimgrep /"/ ./**/*.c

" Quick replace 
nmap <leader>r yiw:%s/"//gODOD
vmap <leader>r y:%s/"//gODOD

"-----------------------------------------------------------------------------
" Set up autocommands
"-----------------------------------------------------------------------------
" Source the vimrc file after saving it
if has("autocmd")
    autocmd! bufwritepost .vimrc source $MYVIMRC
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    au Bufenter *.hs compiler ghc
    " OpenCL filetype detection
    au BufRead,BufNewFile *.cl set filetype=opencl
    " SConstruct filetype detection
    au BufRead,BufNewFile SConstruct set filetype=python
    
    " Tcl
    autocmd FileType tcl syntax region tclBlock start="{" end="}" transparent fold
    autocmd FileType tcl set foldnestmax=5
endif

"-----------------------------------------------------------------------------
" Plugin preferences
"-----------------------------------------------------------------------------
" Syntastic
let g:syntastic_cpp_compiler_options = ' -Wall -Werror -std=c++11'
let g:syntastic_cpp_compiler = 'g++-4.7'
let g:syntastic_cpp_include_dirs = [ '/usr/include/qt4/Qt', '/usr/include/qt4', '/usr/include/qt4/QtGui', '/usr/include/qt4/QtCore' ]

" ultisnips snippet location
let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/UltiSnips"

" Command-T settings
let g:CommandTMaxFiles=30000
set wildignore+=*.o,*.obj,*.d,.git,CVS,.svn

" Use unicode symbols for powerline
let g:Powerline_symbols="unicode"

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
if has("autocmd")
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
endif
set completeopt=longest,menuone

"-----------------------------------------------------------------------------
" Custom local vimrc
"-----------------------------------------------------------------------------
if filereadable(".custom.vim")
    so .custom.vim
endif

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has("gui_running")
    " Remove menu bar
    set guioptions-=m

    " Remove toolbar
    set guioptions-=T

    " Remove all gui scrollbars! $%^& em!
    set guioptions+=LlRrb
    set guioptions-=LlRrb

    set gfn=Inconsolata\ 12
    if !exists("g:vimrcloaded")
        winpos 0 0
        winsize 130 100
        let g:vimrcloaded = 1
    endif
endif
