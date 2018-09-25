call plug#begin('/Users/pix/.vim/plugged')

Plug 'elixir-lang/vim-elixir'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'ap/vim-css-color', { 'for': 'javascript' }
Plug 'bronson/vim-trailing-whitespace'
Plug 'hail2u/vim-css3-syntax'
Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Valloric/YouCompleteMe'

" Initialize plugin system
call plug#end()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" keep the current selection when indenting (thanks cbus)
vnoremap < <gv
vnoremap > >gv

" adds a vertical highlight on cursor (useful for indentation based markups)
" set cursorcolumn

" you can change buffer without saving
set hidden

" Buffers
" noremap <S-tab> :bp!<CR>
" noremap <tab> :bn!<CR>

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

set nocompatible

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on

if !exists("g:syntax_on")
  syntax enable
endif
set number
set hlsearch
set showmatch
set autoindent
set history=1000
" set cursorline

if has("unnamedplus")
  set clipboard=unnamedplus
elseif has("clipboard")
  set clipboard=unnamed
endif

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" netrw options
let g:netrw_banner = 0

" HTML indentation
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Solarized
set background=dark
colorscheme solarized

" no background on numbers
highlight clear LineNr
highlight clear SignColumn

" powerline
set rtp+=/Users/pix/.asdf/installs/python/3.7.0/lib/python3.7/site-packages/powerline/bindings/vim
set laststatus=2
set guifont=Monaco\ for\ Powerline

" creates the swapfiles in /tmp
set dir=/tmp

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

" syntax for flexbox and css3 properties
au BufRead,BufNewFile *.sass set filetype=scss.css

" force the old regex engine on any vim version > 7.3.969
set re=1

" fzf options

nmap <Leader>b :Buffers<CR>
nmap <c-p> :GFiles<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>c :Commits<CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \ <bang>0)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" ALE config
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']

