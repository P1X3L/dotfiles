" keep the current selection when indenting (thanks cbus)
vnoremap < <gv
vnoremap > >gv

" adds a vertical highlight on cursor (useful for indentation based markups)
set cursorcolumn

" you can change buffer without saving
set hidden

" Buffers
noremap <S-tab> :bp!<cr>
noremap <tab> :bn!<cr>

" Remove scrollbars
set guioptions-=r
set guioptions-=L

" shift+R on paragraph resets textwidth on selection
nnoremap R gq}

" Show tabs
set list

" Define characters for 'tabs' and 'end of line'
set listchars=tab:▸\ ,eol:¬

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" sachet's vimrc
set nocompatible

" Pathogen
call pathogen#infect()
call pathogen#helptags()
 
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
 
syntax on
set number
set hlsearch
set showmatch
set autoindent
set history=1000
set cursorline
if has("unnamedplus")
  set clipboard=unnamedplus
elseif has("clipboard")
  set clipboard=unnamed
endif

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Nerdtree

" NERDtree toggle
map <C-n> :NERDTreeToggle<CR>

" Don't open if it's a file
function! StartUp()
  if 0 == argc()
    NERDTree
  end
endfunction

autocmd VimEnter * call StartUp()
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
 
" HTML indentation
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Molokai
let g:molokai_original = 1
colorscheme molokai

" powerline
set rtp+=/Users/pix/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set laststatus=2
set guifont=Monaco\ for\ Powerline

" creates the swapfiles in /tmp
set dir=/tmp

