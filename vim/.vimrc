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
set tabstop=1       " tab = 2 spaces
set shiftwidth=1    " tab width
set softtabstop=0   " tab width
set noswapfile      " dont create swap file
set nobackup        " dont create backup files
set nowritebackup   " dont write backup files
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
set hlsearch        " highlight search results
set nopaste         " disable paste by default
set colorcolumn=80  " set column width
set nojoinspaces    " use one space, not two after punctuation
set splitbelow      " Open split panes to the right
set splitright      " Open split panes to the bottom

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
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'andrewstuart/vim-kubernetes'
Plug 'arcticicestudio/nord-vim'
Plug 'baskerville/vim-sxhkdrc'
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'honza/vim-snippets'
Plug 'itchyny/calendar.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'mzlogin/vim-markdown-toc'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pearofducks/ansible-vim'
Plug 'plasticboy/vim-markdown'
Plug 'roxma/nvim-yarp' "deoplete dep
Plug 'roxma/vim-hug-neovim-rpc' "deoplete dep
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer' } "also requires: pip2 install --user --upgrade neovim
Plug 'vim-syntastic/syntastic' "deoplete dep
Plug 'w0rp/ale'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
call plug#end()

" --- general options
set encoding=utf-8
set laststatus=2
colorscheme nord
syntax enable

" Change BAR cursor to BEAM cursor on insert
autocmd InsertEnter,InsertLeave * set cul!

" Wrap markdown files at 80 chars
au BufRead,BufNewFile *.md setlocal textwidth=80

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

" show hidden files
let NERDTreeShowHidden=1

" show nerdtree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" --- plugin: easyalign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" --- plugin: terraform
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" --- plugin: deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" --- plugin: syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" --- plugin: terraform-completion (run :checkHealth to validate)
let g:terraform_completion_keys = 1
let g:deoplete#omni_patterns = {}

call deoplete#custom#option('omni_patterns', {
\ 'complete_method': 'omnifunc',
\ 'terraform': '[^ *\t"{=$]\w*',
\})

call deoplete#initialize()

" --- plugin: better-whitespace
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1

" --- plugin: markdown-toc
let g:vmt_list_item_char = '-'

" --- plugin: go
let g:go_fmt_command = "goimports"
