" Pathogen
execute pathogen#infect()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" keep the current selection when indenting (thanks cbus)
vnoremap < <gv
vnoremap > >gv

" adds a vertical highlight on cursor (useful for indentation based markups)
set cursorcolumn

" you can change buffer without saving
set hidden

" Buffers
noremap <S-tab> :bp!<CR>
noremap <tab> :bn!<CR>

" Tabs
noremap <C-Right> :tabnext<CR>
noremap <C-Left> :tabprevious<CR>

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

" Solarized
 syntax enable
 set background=dark
 colorscheme solarized

" powerline
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
set guifont=Monaco\ for\ Powerline

" creates the swapfiles in /tmp
set dir=/tmp

" Auto-reload modified files (with no local changes)
set autoread

" Rainbow parentheses
let g:rainbow_active = 1

" vim-instant-markdown
let g:instant_markdown_slow = 1
let g:instant_mardown_autostart = 0

" vim-commentary

" set gitcommit commentstring to '#'
autocmd FileType gitcommit set commentstring=#%s

" reset timeout on esc key (ttimeoutlength) but keep timeout on '\' leader key (timeoutlen)
set timeoutlen=1000 ttimeoutlen=0

" Swap iTerm2 cursors in vim insert mode when using tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" use the silver searcher (AG) for ctrlp
let g:ctrlp_user_command = 'ag %s -l -i -g ""'
let g:ctrlp_use_caching = 0

" git grep inside vim using AG
set grepprg=ag\ --nogroup
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
