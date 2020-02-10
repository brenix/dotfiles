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
call plug#begin('~/.cache/nvim/plugged')

" Dependencies
Plug 'tpope/vim-rhubarb' " Dependency for tpope/fugitive

" General plugins
Plug 'Yggdroot/indentLine'
Plug 'aesophor/base16-faded'
Plug 'airblade/vim-rooter'
Plug 'andrewstuart/vim-kubernetes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'juliosueiras/vim-terraform-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'lifepillar/vim-colortemplate'
Plug 'majutsushi/tagbar'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'mhinz/vim-startify'
Plug 'moll/vim-bbye'
Plug 'mzlogin/vim-markdown-toc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'dylanaraps/wal.vim'
Plug 'morhetz/gruvbox'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'rakr/vim-one'
Plug 'sainnhe/edge'
Plug 'sainnhe/gruvbox-material'
Plug 'jacoborus/tender.vim'

call plug#end()

" Autoupdate
function! OnVimEnter() abort
  " Run PlugUpdate every week automatically when entering Vim.
  if exists('g:plug_home')
    let l:filename = printf('%s/.vim_plug_update_%s', g:plug_home, strftime('%Y_%V'))
    if filereadable(l:filename) == 0
      call execute('PlugUpdate')
      call system(printf('touch %s', l:filename))
    endif
  endif
endfunction

autocmd VimEnter * call OnVimEnter()

" }}}

" --- General Options {{{

set autoindent                 " Take indent for new line from previous line
set autoread                   " Reload file if the file changes on the disk
set backspace=indent,eol,start " Allow backspacing over indentation/line breaks/insertion
set breakindent                " Wrap long lines of text with initial indentation
set cmdheight=2                " Set height of the cmd pane to 1
set complete-=i                " Limit the files searched for auto-completes
set completeopt-=preview       " Remove the horrendous preview window
set completeopt=longest,menu   " Make completion popup menu work like ide
set conceallevel=0             " Disable concealed text
set copyindent                 " Copy the previous indentation on autoindent
set cursorline                 " Highlight the current line for the cursor
set encoding=utf-8             " Set encoding to UTF-8
set expandtab                  " Expands tabs to spaces
set formatoptions=tqonj        " Set vims text formatting options
set guioptions-=e              " Don't use GUI tabline
set hidden                     " Ensure closing a buffer doesnt exit
set lazyredraw                 " Don’t update screen during macro and script execution
set linebreak                  " Avoid wrapping a line in the middle of a word
set matchtime=1                " Reduce the time it takes to show matching brackets
set nobackup                   " Dont create backup files
set noerrorbells               " Disable bells
set nojoinspaces               " Use one space, not two after punctuation
set nospell                    " Disable spell checking
set noswapfile                 " Disable swapfile usage
set novisualbell               " Disable visual bells
set nowrap                     " Disable automatic wrapping
set nowritebackup              " Dont write backup files
set number                     " Show number ruler
set ruler                      " Always show current positions along the bottom
set shiftround                 " Round the indentation to the nearest multiple of shiftwidth
set shortmess=aFc              " Avoid hit-enter prompts caused by file messages
set showmatch                  " Show matching brackets
set showtabline=2              " Show tabline
set signcolumn=yes             " always show signcolumns
set smartcase                  " Ignore unless capital letters
set smartindent                " Enable smart indentation
set smarttab                   " Use shiftwidth and softtabstop
set softtabstop=2              " Tab width
set splitbelow                 " Open horizontal panes to the bottom
set splitright                 " Open vertical panes to the right
set switchbuf=useopen,split    " Set behavior when switching between buffers
set tabstop=2                  " Tab = 2 spaces
set timeout ttimeout           " Enable timeout and ttimeout options
set timeoutlen=500             " Time in ms to wait for a mapped sequence to complete
set title                      " Let vim set the terminal title
set ttimeoutlen=10             " Time in ms to wait for a key sequence to complete
set updatetime=300             " Redraw the status bar often
set wildmenu                   " Enable wildmenu comand line completion
set wildmode=longest,list,full " Bash-like tab completion in command bar

" Enable mouse if possible
if has('mouse')
  set mouse=a
endif

" Close netrw buffer after opening file
let g:netrw_fastbrowse = 0

" }}}

" --- Formatting/Saving {{{

" Highlight trailing whitespace
match errorMsg /\s\+$/

function! StripTrailingWhitespace()
  " Dont strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfunction

augroup mygroup
  autocmd!
  " Remove trailing whitespace on save
  autocmd BufWritePre * call StripTrailingWhitespace()

  " Disable inserting comments on new line
  autocmd FileType * set formatoptions-=c formatoptions-=r formatoptions-=o

  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  " Automatically format shell scripts on save
  autocmd BufWritePre *.sh :normal migg=G`i
augroup end

" }}}

" --- Colors {{{

" Enable truecolor support in NVIM
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
endif

" Enable syntax highlighting
syntax enable

" Use dark background
set background=dark

" Selected colorscheme
let g:gruvbox_material_background = 'hard'
colorscheme tender

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
map <leader>x :Bwipeout<CR>
map <leader>X :Bwipeout!<CR>

" Write
nmap <leader>w :w<CR><CR>
nmap <leader>W :wq<CR>

" Quit
nmap <silent> <leader>q :q<CR>
nmap <silent> <leader>Q :q!<CR>

" Open edit line with current file path
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" Splits
nmap <leader>s :split<CR>
nmap <leader>S :new<CR>
nmap <leader>v :vsplit<CR>
nmap <leader>V :vnew<CR>

" Add newline characters
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

" Find in files
nmap <leader>f :Rg<space>

" Reload vimrc
nmap <leader>r :source ~/.config/nvim/init.vim<CR>

" Switch windows
nmap zz <C-W><C-W>

" Hacky method to get FZF to prioritize files closest to the current open file
" See https://github.com/jonhoo/proximity-sort
" Requires `proximity-sort` command (cargo build)
function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'rg --files' : printf('rg --files --hidden -g "!.git" | proximity-sort %s', expand('%'))
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

" Align markdown table
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Toggle line numbers
nnoremap <leader>l :set invnumber<CR>

" Toggle indentLine
nnoremap <leader>i :IndentLinesToggle<CR>

" Comment/Un-comment
nnoremap <leader>' :Commentary<CR>
vnoremap <leader>' :Commentary<CR>

" Show diagnostics
nnoremap <leader>d :<C-u>CocList diagnostics<CR>

" Toggle tagbar
nnoremap <leader>t :TagbarToggle<CR>

" ----- Function keys

" Rename function
nnoremap <F2> <Plug>(coc-rename)

" Add shortcut for toggling the tag bar
nnoremap <F4> :TagbarToggle<CR>

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" ----- Misc keybindings

" Normal mode: switch between buffers
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

" Insert mode: Un-indent using shift-tab
inoremap <S-Tab> <C-D>

" Visual mode: Use tab to indent highlighted blocks
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

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

" --- Plugin: itchyny/lightline.vim {{{

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" Set lightline config
let g:lightline = {
  \ 'colorscheme': 'tender',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction'
  \ },
  \ }

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" Enable icons
let g:lightline#bufferline#enable_devicons = 1

" Enable unicode symbols
let g:lightline#bufferline#unicode_symbols = 1

" }}}

" --- Plugin: junegunn/fzf.vim {{{

" Show fzf in the same buffer
let g:fzf_layout = { 'window': 'enew' }

" Jump to existing window if possible
let g:fzf_buffers_jump = 1

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

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

"Insert newline with matching brackets
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"

" }}}

" --- Plugin: sheerun/vim-polyglot {{{

" ----- Markdown

" Disable syntax support for these languages in favor of other packages
let g:polyglot_disabled = ['go', 'yaml']

" Disable folding
let g:vim_markdown_folding_disabled = 1

" Disable concealed text
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Auto shrink the TOC, so that it won't take up 50% of the screen
let g:vim_markdown_toc_autofit = 1

" Use - character for list items
let g:vmt_list_item_char = '-'

" Disable list item indentation
let g:vim_markdown_new_list_item_indent = 0

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

" --- Plugin: suan/vim-instant-markdown {{{

let g:instant_markdown_autostart = 0

" }}}

" --- Plugin: fatih/vim-go {{{

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" disable autocompletion
let g:go_code_completion_enabled = 0

" additional syntax highlighting
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1

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
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

"----------------------------------------------
" Language: HCL
"----------------------------------------------
au FileType hcl set expandtab
au FileType hcl set shiftwidth=2
au FileType hcl set softtabstop=2
au FileType hcl set tabstop=2

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
au FileType markdown set conceallevel=0
au FileType markdown set colorcolumn=81
au FileType markdown set textwidth=80
au FileType markdown set wrap

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
au FileType vim set shiftwidth=2
au FileType vim set softtabstop=2
au FileType vim set tabstop=2

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2

"----------------------------------------------
" Language: zsh
"----------------------------------------------
au FileType zsh set expandtab
au FileType zsh set shiftwidth=2
au FileType zsh set softtabstop=2
au FileType zsh set tabstop=2

"}}}

" vim:foldmethod=marker:foldlevel=0

