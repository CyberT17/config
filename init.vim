set number
set paste
set updatetime=100
set ruler
set nu rnu
set showcmd
set showmatch
set incsearch
set hlsearch
set cursorline
set confirm
set completeopt=menuone,noinsert,noselect
set splitright
set splitbelow
set smartcase
set diffopt+=vertical
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set signcolumn=yes
set wrap linebreak nolist
set updatetime=750
set clipboard=unnamed

call plug#begin('~/AppData/Local/nvim/plugged')
" Spaceduck Theme
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'pangloss/vim-javascript'

Plug 'szw/vim-maximizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'
Plug 'tpope/vim-commentary'
Plug 'sbdchd/neoformat'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" vim-fugitive: Plugin for Git
Plug 'tpope/vim-fugitive'

" nerdtree: Tree Explorer Plugin
Plug 'scrooloose/nerdtree'

" vim-gitgutter: Plugin to show git diff markers
Plug 'airblade/vim-gitgutter'

" vim-indent-guides: Visual indicators for indents
Plug 'nathanaelkane/vim-indent-guides'

" delimitMate: Auto complete quotes, parens, brackets, etc 
Plug 'Raimondi/delimitMate'

" Neovim start screen
Plug 'mhinz/vim-startify'

Plug 'Yggdroot/indentLine'

call plug#end()

let g:airline_theme = 'spaceduck'
    if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif

   colorscheme spaceduck


noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

filetype plugin indent on
let mapleader = " " 
let g:netrw_banner=0
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript']
nnoremap <leader>v :e $MYVIMRC<CR>

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Indent Lines
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"szw/vim-maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

"kassio/neoterm
let g:neoterm_default_mod = 'vertical'
let g:neoterm_size = 60
let g:neoterm_autoinsert = 1
nnoremap <c-q> :Ttoggle<CR>
inoremap <c-q> <ESC>:Ttoggle<CR>
nnoremap <c-q> <c-\><c-n>:Ttoggle<CR>

"sbdchd/neoformat
nnoremap <leader>F :Neoformat prettier<CR>

" junegunn/fzf.vim
nnoremap <leader><space> :GFiles<CR>
nnoremap <leader>ff :Rg<CR>
inoremap <expr> <c-x><x-f> fzf#vim#complete#path(
     	\ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
	\ fzf#wrap({'dir': expand('%:p:h')}))

if has('nvim')
	au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
	au! FileType fzf tunmap <buffer> <Esc> 
endif

" tpope/vim-fugitive
nnoremap <leader>gg :G<CR>

" New Vertical Window Split
noremap <C-w>v <esc>:vnew<cr>

" Startify Configuration
let g:startify_change_to_vcs_root = 1
let g:startify_use_env = 1
let g:startify_custom_header =
          \ 'startify#center(startify#fortune#cowsay())'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Recent Files']            },
          \ { 'type': 'dir',       'header': ['   CWD '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
