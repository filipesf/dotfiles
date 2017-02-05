" Vundle Setup
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundles
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-bundler'
Plugin 'scrooloose/nerdtree'

Plugin 'tomtom/tlib_vim'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'msanders/snipMate.vim'
Plugin 'tomtom/tcomment_vim'

Plugin 'trusktr/seti.vim'

Plugin 'jayferd/ragel.vim'
Plugin 'othree/html5.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'

Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/Align'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'maksimr/vim-jsbeautify'

Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'itchyny/lightline.vim'

call vundle#end()
filetype plugin indent on

" Set UTF-8 Encoding
set encoding=utf-8
set termencoding=utf-8

syntax enable     " Syntax

set laststatus=2  " Status bar
set shiftround    " Round indent to nearest multiple of 2
set nowrap        " No line-wrapping
set noesckeys     " Faster escape
set title         " Show file title in terminal tab
set cursorline    " Cursor
set ruler         " Show current line and column position in file
set shortmess=atI " File messages and options
set showtabline=2 " Show tabline
set showcmd       " Incomplete Commands
set noshowmode    " Powerlined
set modeline      " Allow modelines
set shiftround    " Round indent to nearest multiple of 2
set nowrap        " No line-wrapping

" Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Line numbers
set number
set numberwidth=5

" Limit line-length to 80 columns by highlighting col 81 onward
if exists("+colorcolumn")
  set colorcolumn=81
endif

" Set 256 Colors
" set t_Co=256
" set term=xterm-256color
" let base16colorspace=256

" Color Scheme
set background=dark
colorscheme seti


" Typography
set guifont=Inconsolata\ for\ Powerline:h18
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_symbols = 'fancy'

" Splits
set splitbelow
set splitright

" Powerline config
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '✗' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

" CSS Autocomplete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Emmet just for HTML & CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Change Emmet trigger to Tab
let g:user_emmet_expandabbr_key = '<tab>'

" Remove underline from HTML files
let html_no_rendering=1

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=3
set sidescrolloff=5

" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1

" Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]

" Resize splits when the window is resized
autocmd VimResized * exe "normal! \<c-w>="

" Front-end Beautify
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" jj and jk to throw you into normal mode from insert mode
inoremap jj <esc>
noremap jk <esc>

" Toggle comments
map  <Leader>_b <c-/>
imap <Leader>_b <c-/>

" Toggle NERDTree
map <c-b> :NERDTreeToggle<CR>

" Disable arrow keys (hardcore)
" map  <up>    <nop>
" imap <up>    <nop>
" map  <down>  <nop>
" imap <down>  <nop>
" map  <left>  <nop>
" imap <left>  <nop>
" map  <right> <nop>
" imap <right> <nop>

" Ignored files
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules)$'
let g:netrw_list_hide='*.o,*.obj,*~,*.swp,.svn,.git,.keep,.hg,CVS,.DS_Store,.sass-cache,.bin,.bundle,node_modules,.pygments-cache,.yardoc,coverage,log,tmp,build,pkg'
set wildignore=*.o,*.obj,*~,*.swp,*.swp$,.svn,.git,.keep,.hg,CVS,.DS_Store,.sass-cache,.bin,.bundle,node_modules,.pygments-cache,.yardoc,coverage,log,tmp,build,pkg

" No compatibility
set nocompatible
