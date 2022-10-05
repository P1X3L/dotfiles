if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'elixir-lang/vim-elixir'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-cucumber'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color', { 'for': 'javascript' }
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'as': 'dracula' } " utf-8 set encoding=utf-8

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
noremap <C-l> :tabnext<CR>
noremap <C-h> :tabprevious<CR>

" Remove scrollbars
set guioptions-=r
set guioptions-=L

" shift+R on paragraph resets textwidth on selection
nnoremap R gq}

" Show tabs
set list

" Define characters for 'tabs' and 'end of line'
" set listchars=tab:▸\ ,eol:¬
set nolist

" Yank text to the OS X clipboard
" noremap <leader>y "*y
" noremap <leader>yy "*Y

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

" if has("unnamedplus")
"   set clipboard=unnamedplus
" elseif has("clipboard")
"   set clipboard=unnamed
" endif

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

" colorscheme
set background=dark
colorscheme dracula

" italics configuration
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic ctermfg=8
highlight htmlArg cterm=italic
highlight typescriptVariableDeclaration ctermfg=4
highlight typescriptDOMDocMethod ctermfg=2

" powerline
set rtp+=$POWERLINE_BINDINGS_PATH/vim
set laststatus=2

" creates the swapfiles in /tmp
set dir=/tmp

" set gitcommit commentstring to '#'
autocmd FileType gitcommit set commentstring=#%s

" reset timeout on esc key (ttimeoutlength) but keep timeout on '\' leader key (timeoutlen)
set timeoutlen=1000 ttimeoutlen=0

" change cursor color
if &term =~ "xterm\\|rxvt"
  " use an green cursor in insert mode
  let &t_SI = "\<Esc>]12;green\x7"
  " use a green cursor otherwise
  let &t_EI = "\<Esc>]12;green\x7"
  silent !echo -ne "\033]12;green\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
endif

" Swap cursors in vim insert mode when using tmux
if exists('$TMUX')
  " let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  " let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SI.="\<Esc>[5 q"
  let &t_EI.="\<Esc>[2 q"
  highlight Normal ctermbg=none

else
  " let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  " let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SI.="\<Esc>[5 q"
  let &t_EI.="\<Esc>[2 q"
  set termguicolors
endif

" syntax for flexbox and css3 properties
au BufRead,BufNewFile *.scss set filetype=scss.css

" force the old regex engine on any vim version > 7.3.969
set re=0

" fzf options

nmap <Leader>b :Buffers<CR>
nmap <c-p> :FZF<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>c :Commits<CR>

" alternative to alt-a to select-all
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

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

" coc config

" use tab to select completion proposal
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
