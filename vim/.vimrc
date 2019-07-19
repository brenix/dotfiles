" --- options
set number          " turn on line numbers and highlight colors
set ruler           " always show current positions along the bottom
set showcmd         " show the command being typed
set number          " display line numbers
set autoindent      " autoindent spaces
set copyindent      " copy the previous indentation on autoindent
set cursorline      " highlight current line
set showmatch       " show matching brackets
set ignorecase      " ignore case when searching
set smartcase       " ignore unless captial letters
set tabstop=2       " tab = 2 spaces
set shiftwidth=2    " tab width
set softtabstop=2   " tab width
set noswapfile      " dont create swap file
set nobackup        " dont create backup files
set autoread        " set to auto read when a file is changed from the outside
set expandtab       " use spaces instead of \t for tabs
set smartindent     " smart indent
set smarttab        " use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set background=dark " dark background
set guioptions+=a   " copy yanked lines to clipboard
set lazyredraw      " performance
set linebreak       " wrap full words instead of partial
set modeline        " recognize modeline
set backspace=2     " make backspace work like in other apps
set nocursorline    " disable underline on current line
set hlsearch        " highlight search results

" --- plugin management: vim-plug (AUR: vim-plug, Manual: https://github.com/junegunn/vim-plug#vim)
if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  set t_Co=256     " 256-colors
  set ttyfast      " performance
  set nocompatible " be iMproved
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer' } "also requires: pip2 install --user --upgrade neovim
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'baskerville/vim-sxhkdrc'
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'gabrielelana/vim-markdown'
Plug 'hashivim/vim-terraform'
Plug 'itchyny/calendar.vim'
Plug 'itchyny/lightline.vim'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pearofducks/ansible-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'townk/vim-autoclose'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()

" --- general options
set encoding=utf-8
set laststatus=2
colorscheme nord
syntax enable

" Change BAR cursor to BEAM cursor on insert
autocmd InsertEnter,InsertLeave * set cul!

" --- keybindings
" navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ctrl+left/right
nmap <ESC>[1;5D <C-Left>
nmap <ESC>[1;5C <C-Right>
cmap <ESC>[1;5D <C-Left>
cmap <ESC>[1;5C <C-Right>
imap <ESC>[1;5D <C-o><C-Left>
imap <ESC>[1;5C <C-o><C-Right>

" ctrl+backspace
nmap <C-h> <C-w>
cmap <C-h> <C-w>
imap <C-h> <C-w>

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" --- plugin: lightline
let g:lightline = {'colorscheme': 'nord'}

" --- plugin: nerdtree
map <C-\> :NERDTreeToggle<CR>

" --- plugin: easyalign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" --- plugin: terraform
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1
