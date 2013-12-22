set nocompatible
filetype off                   " required!

let g:vundle_default_git_proto="git"

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'Shougo/vimproc'
Bundle 'Shougo/neocomplete.vim'
Bundle 'eagletmt/neco-ghc'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
" dont want this to override defaults!
" Bundle 'derekwyatt/vim-scala'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-abolish'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'SirVer/ultisnips'
Bundle 'Lokaltog/vim-powerline'
Bundle 'yurifury/hexHighlight'
Bundle 'mattn/gist-vim'

" Colorscheme
Bundle 'xoria256.vim'

Bundle 'NERD_tree-Project'
" For automatically marking scripts as executable
Bundle 'Shebang'
Bundle 'bufkill.vim'
Bundle 'vcscommand.vim'

 " Dummy entry for CommandT
Bundle 'CommandTVimball'
Bundle 'OmniCppComplete'
Bundle 'pythoncomplete'
Bundle 'taglist.vim'
Bundle 'a.vim'
Bundle 'opencl.vim'

" haskell
Bundle 'eagletmt/ghcmod-vim'


filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..