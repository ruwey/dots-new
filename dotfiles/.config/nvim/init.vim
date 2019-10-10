			"""""""""""""""""""""""""""""
			" ██      ██ ██             "
			"░██     ░██░░              "
			"░██     ░██ ██ ██████████  "
			"░░██    ██ ░██░░██░░██░░██ "
			" ░░██  ██  ░██ ░██ ░██ ░██ "
			"  ░░████   ░██ ░██ ░██ ░██ "
			"   ░░██    ░██ ███ ░██ ░██ "
			"    ░░     ░░ ░░░  ░░  ░░  "
			"			    "
			"            R C	    "
			"""""""""""""""""""""""""""""
source $HOME/.config/nvim/yaml_load.vim

"-- Plugins {{{
let s:yaml_plugins = Yaml_load('~/.config/nvim/plugins.yaml')

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/ruwey/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/ruwey/.vim/dein')
call dein#begin('/home/ruwey/.vim/dein')

" Required:
call dein#add('/home/ruwey/.vim/dein/repos/github.com/Shougo/dein.vim')

"call dein#add('itchyny/lightline.vim')
"call dein#add('mboughaba/i3config.vim')
"call dein#add('scrooloose/nerdcommenter')

for bundle in s:yaml_plugins
  for [bundle_source_name, bundle_options] in items(bundle)
    execute 'call dein#add("' . bundle_source_name . '", ' . string(bundle_options) . ')'
  endfor
endfor

" Required:
call dein#end()
call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

"-- }}}

"-- Color scheme {{{
"colorscheme forest-night
"colorscheme nord
"-- }}}

"-- Settings {{{
"------- Vim settings
set relativenumber

"-- Lightline Settings 
" Disable the insert text as it is unnecessary
set noshowmode

" Set color scheme
let g:lightline = {}
let g:lightline.colorscheme = "forest-night"

" Automaticaly go to insert mode in the terminal
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" No numbers in terminal
au TermOpen * :setlocal norelativenumber

" Folding
set foldmethod=marker

" Dif with saved
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
"-- }}}

"-- Key bindings {{{
" Set leader key
let mapleader = ","

" Open vimrc in a split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Refresh vimrc
nnoremap <leader>rv :source $MYVIMRC<cr>

" Toggle spell check
nnoremap <leader>sp :set spell!<cr>

" Toggle relative numbers
nnoremap <leader>rn :set relativenumber!<cr>

" Toggle numbers
nnoremap <leader>nn :set number!<cr>

" Open a NEW TERMINAL
nnoremap <leader>nt :split<cr> :terminal<cr>
nnoremap <leader>vnt :vsplit<cr> :terminal<cr>

" Exit terminal mode with esc
tnoremap <Esc> <C-\><C-n>

" Bind Copy to + register
vnoremap <C-y> "+y

" Bind paste to + register
map <C-p> "+p

" Get out of insert with jk
inoremap jk <esc>
inoremap <esc> <nop>

" Tab Autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Map ctrl + vim keys to move panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Do the same but in the term
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

"------- Abbreviations
" Make <ld> go to <leader>
iabbrev ld leader

iabbrev @@
			\ ███████                                      <cr>
			\░██░░░░██                              ██   ██<cr>
			\░██   ░██  ██   ██ ███     ██  █████  ░░██ ██ <cr>
			\░███████  ░██  ░██░░██  █ ░██ ██░░░██  ░░███  <cr>
			\░██░░░██  ░██  ░██ ░██ ███░██░███████   ░██   <cr>
			\░██  ░░██ ░██  ░██ ░████░████░██░░░░    ██    <cr>
			\░██   ░░██░░██████ ███░ ░░░██░░██████  ██     <cr>
			\░░     ░░  ░░░░░░ ░░░    ░░░  ░░░░░░  ░░      <cr>

"-- }}}
" vim:fileencoding=utf-8:foldmethod=marker
