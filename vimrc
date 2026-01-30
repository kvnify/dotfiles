"===============================================================================
"==========  CUSTOMIZATION (vimrc)  ============================================
" Modernized configuration for Node.js, Ruby, Swift, and React development
"===============================================================================
set nocompatible
filetype off

"===============================================================================
" vim-plug Installation & Plugin Configuration
"===============================================================================
" Auto-install vim-plug if not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" ===== Core Plugins =====
Plug 'tpope/vim-sensible'              " Sensible defaults
Plug 'tpope/vim-surround'              " Surround text objects
Plug 'tpope/vim-commentary'            " Easy commenting
Plug 'tpope/vim-repeat'                " Repeat plugin commands with .
Plug 'tpope/vim-unimpaired'            " Bracket mappings
Plug 'tpope/vim-sleuth'                " Auto-detect indentation

" ===== File Navigation =====
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                " Fuzzy finder
Plug 'preservim/nerdtree'              " File tree
Plug 'ryanoasis/vim-devicons'          " File icons

" ===== Git Integration =====
Plug 'tpope/vim-fugitive'              " Git commands
Plug 'airblade/vim-gitgutter'          " Git diff in gutter
Plug 'junegunn/gv.vim'                 " Git commit browser

" ===== UI & Themes =====
Plug 'drewtempelmeyer/palenight.vim'   " Palenight colorscheme
Plug 'joshdick/onedark.vim'            " One Dark theme
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'vim-airline/vim-airline'         " Status line
Plug 'vim-airline/vim-airline-themes'  " Airline themes

" ===== Language Support: JavaScript/TypeScript =====
Plug 'pangloss/vim-javascript'         " JavaScript syntax
Plug 'leafgarland/typescript-vim'      " TypeScript syntax
Plug 'MaxMEllon/vim-jsx-pretty'        " JSX/TSX syntax
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'             " GraphQL syntax

" ===== Language Support: Ruby =====
Plug 'vim-ruby/vim-ruby'               " Ruby syntax
Plug 'tpope/vim-rails'                 " Rails support
Plug 'tpope/vim-bundler'               " Bundler integration
Plug 'tpope/vim-rake'                  " Rake support
Plug 'tpope/vim-rbenv'                 " rbenv integration
Plug 'tpope/vim-endwise'               " Auto-add end in Ruby

" ===== Language Support: Swift/iOS =====
Plug 'keith/swift.vim'                 " Swift syntax
Plug 'gfontenot/vim-xcode'             " Xcode integration

" ===== Language Support: Other =====
Plug 'elzr/vim-json'                   " JSON syntax
Plug 'tpope/vim-markdown'              " Markdown syntax
Plug 'cespare/vim-toml'                " TOML syntax
Plug 'stephpy/vim-yaml'                " Better YAML
Plug 'rust-lang/rust.vim'              " Rust syntax
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }  " Go support

" ===== Completion & LSP =====
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " LSP client
Plug 'dense-analysis/ale'              " Async linting

" ===== Utilities =====
Plug 'editorconfig/editorconfig-vim'   " EditorConfig support
Plug 'jiangmiao/auto-pairs'            " Auto-close brackets
Plug 'Yggdroot/indentLine'             " Indent guides
Plug 'vim-scripts/IndexedSearch'       " Show search index
Plug 'mbbill/undotree'                 " Undo tree visualization

call plug#end()

"===============================================================================
" General Settings
"===============================================================================
syntax on
filetype plugin indent on

" Performance
set lazyredraw
set ttyfast
set updatetime=300

" UI
set number
set relativenumber
set cursorline
set showmatch
set showcmd
set ruler
set laststatus=2
set cmdheight=2
set signcolumn=yes
set scrolloff=5

" Colors
set termguicolors
set background=dark
colorscheme palenight
let g:airline_theme='palenight'

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Indentation
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set autoindent
set smartindent

" File handling
set encoding=utf-8
set fileencoding=utf-8
set hidden
set autoread
set autowrite
set noswapfile

" Persistent undo
set undofile
let undos = expand('~/.local/share/vim/undo')
if isdirectory(undos) == 0
  call mkdir(undos, "p")
endif
let &undodir=undos

" Backup directory
set backup
let backups = expand('~/.local/share/vim/backup')
if isdirectory(backups) == 0
  call mkdir(backups, "p")
endif
let &backupdir=backups

" Other
set backspace=indent,eol,start
set clipboard=unnamed,unnamedplus
set mouse=a
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.bak,*.pyc,*.pyo,*.o,*.e,*~,*.swp,*.swo
set wildignore+=*.png,*.jpg,*.gif,*.zip,*.gz
set wildignore+=node_modules/*,bower_components/*,.git/*
set completeopt=menu,menuone,noselect
set shortmess+=c

"===============================================================================
" Key Mappings
"===============================================================================
" Leader key
let mapleader = ","
map , <Leader>

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bl :ls<CR>

" Tab navigation
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>

" Clear search highlight
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" Stay in visual mode after indent
vnoremap > >gv
vnoremap < <gv

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Insert blank lines
nnoremap ]<Space> o<Esc>k
nnoremap [<Space> O<Esc>j

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" Toggle spelling
nnoremap <F5> :setlocal spell! spelllang=en_us<CR>

"===============================================================================
" FZF Configuration
"===============================================================================
" FZF mappings
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <C-p> :Files<CR>

" FZF layout
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

"===============================================================================
" NERDTree Configuration
"===============================================================================
nnoremap <F9> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.git$', 'node_modules', '\.DS_Store']
let NERDTreeMinimalUI=1

" Close vim if NERDTree is the only window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"===============================================================================
" Git Integration
"===============================================================================
" Fugitive mappings
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gp :Git push<CR>

" GitGutter settings
let g:gitgutter_enabled=1
let g:gitgutter_signs=1

" Auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"===============================================================================
" CoC (Conquer of Completion) Configuration
"===============================================================================
" CoC extensions to install
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-solargraph',
  \ 'coc-sourcekit',
  \ 'coc-rust-analyzer',
  \ ]

" Use tab for trigger completion
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <CR> to confirm completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Format code
xmap <leader>cf <Plug>(coc-format-selected)
nmap <leader>cf <Plug>(coc-format-selected)

" Code actions
nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

"===============================================================================
" ALE Configuration
"===============================================================================
let g:ale_disable_lsp = 1  " Disable ALE's LSP since we use CoC
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'ruby': ['rubocop'],
  \ 'swift': ['swiftlint'],
  \ }
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint', 'prettier'],
  \ 'typescript': ['eslint', 'prettier'],
  \ 'ruby': ['rubocop'],
  \ 'swift': ['swiftformat'],
  \ }

"===============================================================================
" Language-Specific Settings
"===============================================================================
" JavaScript/TypeScript
autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal shiftwidth=2 tabstop=2 expandtab
let g:jsx_ext_required = 0

" Ruby
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab

" Swift
autocmd FileType swift setlocal shiftwidth=4 tabstop=4 expandtab

" Go
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4

" JSON
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
let g:vim_json_syntax_conceal = 0

" YAML
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab

"===============================================================================
" Airline Configuration
"===============================================================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1

"===============================================================================
" Custom Functions (Preserved from original config)
"===============================================================================

" Speller: Turn on/off spellchecker
function! Speller()
  if (&spell)
    setlocal nospell
    echo "Speller OFF"
  else
    setlocal spell spelllang=en_us
    echo "Speller ON"
  endif
endfunction
command! Spell call Speller()

" JumpCursorOnEdit: Make cursor jump to last known line
augroup JumpCursorOnEdit
  au!
  autocmd BufReadPost *
    \ if expand("<afile>:p:h") !=? $TEMP |
    \   if line("'\"") > 1 && line("'\"") <= line("$") |
    \     let JumpCursorOnEdit_foo = line("'\"") |
    \     let b:doopenfold = 1 |
    \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
    \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
    \        let b:doopenfold = 2 |
    \     endif |
    \     exe JumpCursorOnEdit_foo |
    \   endif |
    \ endif
  autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \   exe "normal zv" |
    \   if(b:doopenfold > 1) |
    \       exe  "+".1 |
    \   endif |
    \   unlet b:doopenfold |
    \ endif
augroup END

" Kwbd: Kill the current buffer, but don't change the layout
function! Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    let g:kwbdBufNum = bufnr("%")
    let g:kwbdWinNum = winnr()
    windo call Kwbd(2)
    execute "bdelete " . g:kwbdBufNum
    execute "normal " . g:kwbdWinNum . ""
  else
    if(bufnr("%") == g:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != g:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction
map <silent> <Leader>db :call Kwbd(1)<CR>

" BufOnly: Delete all listed buffers except the current one
function! BufOnly()
  let curBuffer = bufnr("%")
  let ListedBuffers = []
  let i = 1
  while (i <= bufnr("$"))
    if (bufexists(i) && buflisted(i))
      call add(ListedBuffers, i)
    endif
    let i+= 1
  endwhile
  for item in ListedBuffers
    if (item != curBuffer)
      execute "silent bdelete " . item
    endif
  endfor
endfunction
map <silent> <Leader>bo :call BufOnly()<CR>

"===============================================================================
" GUI Settings (MacVim, gVim)
"===============================================================================
if has("gui_running")
  set guicursor=a:blinkon0
  set guifont=JetBrainsMono\ Nerd\ Font:h13
  set guioptions-=T  " Remove toolbar
  set guioptions-=m  " Remove menu
  set guioptions-=r  " Remove right scrollbar
  set guioptions-=L  " Remove left scrollbar
endif

" vim: set fdm=marker:
