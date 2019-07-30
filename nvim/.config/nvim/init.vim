" --- Plugin Management {{{

" Auto-install
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

" Dependencies
Plug 'tpope/vim-rhubarb' " Dependency for tpope/fugitive

" General plugins
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-rooter'
Plug 'andrewstuart/vim-kubernetes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/calendar.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'jremmen/vim-ripgrep'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'juliosueiras/vim-terraform-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'majutsushi/tagbar'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'mhinz/vim-startify'
Plug 'mzlogin/vim-markdown-toc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'rakr/vim-one'
Plug 'sainnhe/vim-color-desert-night'

call plug#end()

" }}}

" --- General Options {{{

set autoindent                 " Take indent for new line from previous line
set autoread                   " Reload file if the file changes on the disk
set backspace=indent,eol,start " Allow backspacing over indentation/line breaks/insertion
set cmdheight=2                " Set height of the cmd pane to 2
set colorcolumn=101            " Highlight the 10th column as an indicator
set complete-=i                " Limit the files searched for auto-completes
set completeopt-=preview       " Remove the horrendous preview window
set completeopt=longest,menu   " Make completion popup menu work like ide
set conceallevel=0             " Disable concealed text
set copyindent                 " Copy the previous indentation on autoindent
set cursorline                 " Highlight the current line for the cursor
set encoding=utf-8             " Set encoding to UTF-8
set expandtab                  " Expands tabs to spaces
set formatoptions=tqonj        " Set vims text formatting options
set ignorecase                 " Ignore case when searching
set lazyredraw                 " Don’t update screen during macro and script execution
set linebreak                  " Avoid wrapping a line in the middle of a word
set matchtime=1                " Reduce the time it takes to show matching brackets
set nobackup                   " Dont create backup files
set noerrorbells               " Disable bells
set nofixendofline             " Disable automatic newline character
set nojoinspaces               " Use one space, not two after punctuation
set nospell                    " Disable spell checking
set noswapfile                 " Disable swapfile usage
set novisualbell               " Disable visual bells
set nowrap                     " Dont automatically wrap
set nowritebackup              " Dont write backup files
set number                     " Show number ruler
set ruler                      " Always show current positions along the bottom
set shiftround                 " Round the indentation to the nearest multiple of shiftwidth
set shortmess=aFc              " Avoid hit-enter prompts caused by file messages
set showmatch                  " Show matching brackets
set switchbuf=useopen,split    " Set behavior when switching between buffers
set showtabline=2              " Show tabline
set guioptions-=e              " Don't use GUI tabline
set smartcase                  " Ignore unless capital letters
set smartindent                " Enable smart indentation
set smarttab                   " Use shiftwidth and softtabstop
set softtabstop=2              " Tab width
set splitbelow                 " Open horizontal panes to the bottom
set splitright                 " Open vertical panes to the right
set tabstop=2                  " Tab = 2 spaces
set timeout ttimeout           " Enable timeout and ttimeout options
set timeoutlen=500             " Time in ms to wait for a mapped sequence to complete
set title                      " Let vim set the terminal title
set ttimeoutlen=10             " Time in ms to wait for a key sequence to complete
set updatetime=100             " Redraw the status bar often

" Enable mouse if possible
if has('mouse')
  set mouse=r
endif

" }}}

" --- Formatting/Saving {{{

" Highlight trailing whitespace
match errorMsg /\s\+$/

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Disable inserting comments on new line
autocmd FileType * set formatoptions-=c formatoptions-=r formatoptions-=o

" Automatically sort go imports on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" }}}

" --- Colors {{{

" Enable truecolor support in NVIM
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Enable syntax highlighting
syntax enable

" Use dark background
set background=dark

" Selected colorscheme
colorscheme nord

" }}}

" --- Searching {{{

" Move to match as you type
set incsearch

" Highlight search results
set hlsearch

" Interactive search and replace
if has('nvim')
  set inccommand=split
endif

" Override the search highlight color
highlight Search guibg=SteelBlue guifg=White ctermbg=67 ctermfg=White

" Ignore specific file patterns when expanding
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.log,*.pyc,*.sqlite,*.sqlite3,*.min.js,*.min.css,*.tags
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.pdf,*.dmg,*.app,*.ipa,*.apk,*.mobi,*.epub
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*/.git/*,*/.svn/*,*.DS_Store
set wildignore+=*/node_modules/*,*/nginx_runtime/*,*/build/*,*/logs/*,*/dist/*,*/tmp/*

" }}}

" --- Keybindings {{{

" ----- Leader keybindings

" Set leader key
let g:mapleader = "\<Space>"

" Clear search highlights
map <leader>h :nohlsearch<CR>

" Close buffer
map <leader>x :bd<CR>
map <leader>X :bd!<CR>

" Write
nmap <leader>w :w<CR>
nmap <leader>W :wq<CR>

" Quit
nmap <silent> <leader>q :q<CR>
nmap <silent> <leader>Q :q!<CR>

" Open edit line with current file path
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" Splits
nmap <leader>s :split<CR>
nmap <leader>v :vsplit<CR>

" Reload vimrc
nmap <leader>r :source ~/.config/nvim/init.vim<CR>

" Hacky method to get FZF to prioritize files closest to the current open file
" See https://github.com/jonhoo/proximity-sort
" Requires `proximity-sort` command (cargo build)
function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'rg --files' : printf('rg --files | proximity-sort %s', expand('%'))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--color=dark --tiebreak=index'}, <bang>0)

" Fuzzy open file
nnoremap <leader>p :Files<cr>

" List buffers
nnoremap <leader>k :Buffers<cr>

" Toggle between last two buffers
nnoremap <leader><leader> <c-^>

" Toggle git gutters
nnoremap <silent> <leader>g :<C-u>CocCommand git.toggleGutters<CR>

" Toggle NERDTree
nnoremap <silent> <leader>\ :NERDTreeToggle<CR>

" Focus NERDTree
nnoremap <silent> <leader>n :NERDTreeFocus<CR>

" Reveal file in NERDTree
nnoremap <silent> <leader>f :NERDTreeFind<CR>

" ----- Function keys

" Toggle paste mode
set pastetoggle=<F2>

" Add shortcut for toggling the tag bar
nnoremap <F4> :TagbarToggle<CR>

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Toggle line numbers
nnoremap <F6> :set invnumber<CR>


" ----- Misc keybindings

" Normal mode: switch between buffers
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

nnoremap  ]b :bp<CR>
nnoremap  [b :bn<CR>

" Insert mode: Un-indent using shift-tab
inoremap <S-Tab> <C-d>

" ----- Passive keybindings

" Fix some common typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Smart move
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Standardize ctrl+left ctrl+right
nmap <ESC>[1;5D <C-Left>
nmap <ESC>[1;5C <C-Right>
cmap <ESC>[1;5D <C-Left>
cmap <ESC>[1;5C <C-Right>
imap <ESC>[1;5D <C-o><C-Left>
imap <ESC>[1;5C <C-o><C-Right>

" Standardize ctrl+backspace
nmap <C-h> <C-w>
cmap <C-h> <C-w>
imap <C-h> <C-w>

" Automatically center line upon searching
nnoremap n nzzzv
nnoremap N Nzzzv

" }}}

" --- Plugin: itchyny/calendar.vim {{{

" Enable Google Calendar integration.
let g:calendar_google_calendar = 1

" Enable Google Tasks integration.
let g:calendar_google_task = 1

" Other options
let g:calendar_first_day = "monday" " Weeks starts with Monday
let g:calendar_date_endian = "big"  " Format: year / month / day
let g:calendar_date_separator = "-" " Format: year - month - day
let g:calendar_week_number = 1      " Show week numbers
let g:calendar_view = "days"        " Set days as the default view

" }}}

" --- Plugin: itchyny/lightline.vim {{{

" Set lightline theme
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }

" Disable background color to match with terminal
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'black' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle

let g:lightline.tabline          = {'left': [['buffers']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" }}}

" --- Plugin: junegunn/fzf.vim {{{

" Show fzf in the same buffer
let g:fzf_layout = { 'window': 'enew' }

" Jump to existing window if possible
let g:fzf_buffers_jump = 1

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', '#5f5f87'],
  \ 'hl':      ['fg', 'Function'],
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

if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
else
  echom "ripgrep not installed, you should install it now"
endif

" Set list of directories to search for projects
let g:project_dirs = ['~/work', '~/ida']

" Change working root directory
nnoremap <C-p> :call fzf#run({'source': 'find '. join(g:project_dirs).' -type d -maxdepth 1', 'sink': 'lcd'})<cr>

" }}}

" --- Plugin: majutsushi/tagbar {{{

" Go configuration
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
  \ }

" }}}

" --- Plugin: neoclide/coc {{{

" Use tab to rotate between completion
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Use the following character to display errors
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'

" Extensions
let g:coc_global_extensions = [
      \'coc-css',
      \'coc-dictionary',
      \'coc-git',
      \'coc-highlight',
      \'coc-html',
      \'coc-json',
      \'coc-lists',
      \'coc-marketplace',
      \'coc-pairs',
      \'coc-prettier',
      \'coc-python',
      \'coc-snippets',
      \'coc-syntax',
      \'coc-tabnine',
      \'coc-tag',
      \'coc-template',
      \'coc-translator',
      \'coc-yaml',
      \'coc-yank'
      \]

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" }}}

" --- Plugin: scrooloose/nerdtree {{{

" Automatically open nerdtree
autocmd vimenter * NERDTree | wincmd w

" Close nvim if nerdtree is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Set column size
let g:NERDTreeWinSize = 40

" Show hidden files
let NERDTreeShowHidden = 1

" }}}

" --- Plugin: sheerun/vim-polyglot {{{

" ----- Markdown

" Disable folding
let g:vim_markdown_folding_disabled = 1

" Disable concealed text
let g:vim_markdown_conceal = 0

" Auto shrink the TOC, so that it won't take up 50% of the screen
let g:vim_markdown_toc_autofit = 1

" Use - character for list items
let g:vmt_list_item_char = '-'

" Adjust new list item indentation to 2
let g:vim_markdown_new_list_item_indent = 2

" ----- Terraform

" Automatic alignment as your typing
let g:terraform_align = 1

" Run terraform fmt on save
let g:terraform_fmt_on_save = 1

" ----- Golang

" Run goimports when running gofmt
let g:go_fmt_command = "goimports"

" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1

" Add the failing test name to the output of :GoTest
let g:go_test_show_name = 1

" }}}

" --- Plugin: terryma/vim-multiple-cursors {{{

" When pressing escape in Visual mode, quit and delete all existing cursors
let g:multi_cursor_exit_from_visual_mode = 1

" When pressing escape in Insert mode, quit and delete all existing cursors
let g:multi_cursor_exit_from_insert_mode = 1

" }}}

" --- Language Formatting {{{
"----------------------------------------------
" Language: Bash
"----------------------------------------------
au FileType sh set expandtab
au FileType sh set shiftwidth=2
au FileType sh set softtabstop=2
au FileType sh set tabstop=2

"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set expandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2

"----------------------------------------------
" Language: gitcommit
"----------------------------------------------
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

"----------------------------------------------
" Language: gitconfig
"----------------------------------------------
au FileType gitconfig set noexpandtab
au FileType gitconfig set shiftwidth=2
au FileType gitconfig set softtabstop=2
au FileType gitconfig set tabstop=2

"----------------------------------------------
" Language: HTML
"----------------------------------------------
au FileType html set expandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2

"----------------------------------------------
" Language: LESS
"----------------------------------------------
au FileType less set expandtab
au FileType less set shiftwidth=2
au FileType less set softtabstop=2
au FileType less set tabstop=2

"----------------------------------------------
" Language: Make
"----------------------------------------------
au FileType make set noexpandtab
au FileType make set shiftwidth=2
au FileType make set softtabstop=2
au FileType make set tabstop=2

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
au FileType markdown set expandtab
au FileType markdown set shiftwidth=2
au FileType markdown set softtabstop=2
au FileType markdown set tabstop=2
au FileType markdown set syntax=markdown
au FileType markdown set conceallevel=0

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

"----------------------------------------------
" Language: Ruby
"----------------------------------------------
au FileType ruby set expandtab
au FileType ruby set shiftwidth=2
au FileType ruby set softtabstop=2
au FileType ruby set tabstop=2

"----------------------------------------------
" Language: SQL
"----------------------------------------------
au FileType sql set expandtab
au FileType sql set shiftwidth=2
au FileType sql set softtabstop=2
au FileType sql set tabstop=2

"----------------------------------------------
" Language: TOML
"----------------------------------------------
au FileType toml set expandtab
au FileType toml set shiftwidth=2
au FileType toml set softtabstop=2
au FileType toml set tabstop=2

"----------------------------------------------
" Language: vimscript
"----------------------------------------------
au FileType vim set expandtab
au FileType vim set shiftwidth=4
au FileType vim set softtabstop=4
au FileType vim set tabstop=4

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2

"}}}

" vim:foldmethod=marker:foldlevel=0

