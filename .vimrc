set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'neoclide/coc.nvim'			" Intellisense engine
Plugin 'tpope/vim-fugitive'			" Git wrapper
"Plugin 'ctrlpvim/ctrlp.vim' 			" Fuzzy search
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plugin 'tpope/vim-surround'			" Quoting / parenthesizing
Plugin 'scrooloose/nerdcommenter'		" Comments
Plugin 'scrooloose/nerdtree'			" Tree file explorer
Plugin 'gruvbox-community/gruvbox'
Plugin 'sheerun/vim-polyglot' " Language pack (html, js, ts, jsx and much much more)
Plugin 'styled-components/vim-styled-components'
Plugin 'mbbill/undotree'

call vundle#end()            " required
filetype plugin indent on    " required

" Theme and syntax
"syntax on
set term=xterm-256color
set background=dark
let g:gruvbox_contrast_dark = 'hard'
set t_Co=256
set t_ut=
colorscheme gruvbox
syntax enable

" Corrigir o delay ao mudar de modo
"set ttimeoutlen=25
set timeoutlen=1000 ttimeoutlen=0

" Ctrl+s to save, in normal ou insert mode
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>

" Indentação
filetype plugin indent on
set expandtab               " On pressing tab, insert 2 spaces
set tabstop=2               " show existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2

" Don't break long lines!
set wrap!

" Leader
let mapleader=" "
nnoremap <leader>u :UndotreeShow<CR>

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set ruler
set number
set relativenumber
set cursorline
hi CursorLine ctermbg=235
autocmd InsertEnter * hi CursorLine ctermbg=234
autocmd InsertLeave * hi CursorLine ctermbg=235

" Change cursor shape
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

let no_buffers_menu=1

" vim-airline
let g:airline_theme = 'gruvbox'
"let g:airline_theme = 'one'
"let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
"let g:airline_skip_empty_sections = 1
"let g:airline_powerline_fonts = 1
set noshowmode                   " Não preciso exibir mais uma linha com o modo

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize = 50
let g:NERDTreeMapPreview="<F4>"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeIgnore = ['^node_modules$']
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

" CoC config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'

" Ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Disable keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Remover espaços em branco automaticamente ao salvar
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

