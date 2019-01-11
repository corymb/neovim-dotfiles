"##########"
" vim-plug "
"##########"

call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/tcomment'
call plug#end()


"#########################"
" Custom Editor Shortcuts "
"#########################"

" Unmappings:
map <F1> <Nop>
map Q <Nop>

" Assign a leader:
let g:mapleader = ","

" Fast saving:
nmap <leader>s :w<CR>

" Close buffer:
nmap <leader>bd :bd<CR>

" Map arrows to switch between open buffers:
map <right> :bn<CR>
map <left> :bp<CR>

" Unhighlight:
map <leader>z :noh<CR>

" Remap 0 to start at begining of text:
map 0 ^

" and § to end ($):
map § $
map ` $

" Reload vimrc:
map <leader>v :so $MYVIMRC<CR>

" Switch split:
function! ToggleWindowHorizontalVerticalSplit()
  if !exists('t:splitType')
    let t:splitType = 'vertical'
  endif

  if t:splitType == 'vertical' " is vertical switch to horizontal
    windo wincmd K
    let t:splitType = 'horizontal'

  else " is horizontal switch to vertical
    windo wincmd H
    let t:splitType = 'vertical'
  endif
endfunction

nnoremap <silent> <leader>r :call ToggleWindowHorizontalVerticalSplit()<cr>


"#####################"
" Appearance Settings "
"#####################"

set number
set linebreak

let g:airline_powerline_fonts = 1


"####################"
" Behaviour Settings "
"####################"

" Indentation
set shiftwidth=2

" Replace tabs with spaces:
set expandtab

" Disable automatic insertion of comments (includes workaround setting for bug #4684):
filetype plugin indent on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Use system clipboard (OS X):
set clipboard=unnamed

" Vertical splits default to right hand side:
set spr

" Disable 'no write since last change':
set hidden

" Disable swapfile:
set noswapfile

" Search:
set ignorecase    " case insensitive
set smartcase     " match uppercase letters
set hlsearch      " Highlight search terms
set incsearch     " Show search matches typed

" Remember last position in file:
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

" Emacs bindings for the command line:
cnoremap <C-A>        <Home>
cnoremap <C-E>        <End>
cnoremap <C-K>        <C-U>


"##########"
" Plugins: "
"##########"

" NERDTree:
map <F2> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.pyc$']

" tComment:
map <leader>cc :TComment<CR>

" Supertab:
let g:SuperTabDefaultCompletionType = "<c-n>"

" FZF:
map <leader>t :FZF <CR>
map <leader>f :Rg 
