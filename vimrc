" Run `infect` to bundle vim plugins
" https://github.com/csexton/infect
"
"=bundle fatih/vim-go
"=bundle elzr/vim-json
"=bundle ekalinin/Dockerfile.vim
"=bundle tpope/vim-pathogen
"=bundle tpope/vim-sensible
"=bundle scrooloose/nerdtree
"=bundle tpope/vim-fugitive
"=bundle tpope/vim-endwise
"=bundle csexton/trailertrash.vim
"=bundle csexton/vim-markdown
"=bundle rking/ag.vim
"=bundle pangloss/vim-javascript
"=bundle slim-template/vim-slim
"=bundle tpope/vim-bundler
"=bundle tpope/vim-rake
"=bundle tpope/vim-haml
"=bundle tpope/vim-surround
"=bundle bling/vim-airline
"=bundle airblade/vim-gitgutter
"=bundle godlygeek/tabular
"=bundle moll/vim-node
"=bundle hashivim/vim-terraform
"=bundle wannesm/wmgraphviz.vim
"=bundle chr4/nginx.vim

" Disabled Plugins
"bundle Shougo/neocomplete.vim
"bundle sjl/gundo.vim
"bundle kien/ctrlp.vim
"bundle Shougo/unite.vim
"bundle fatih/vim-hclfmt
"bundle hashivim/vim-packer
"bundle ervandew/ag

source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect('bundle/{}')

" Wildmenu completion
set wildmenu
set wildmode=list:longest,list:full
set wildmode=longest:full,full
set wildignore+=*~
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=*vendor/gems/*

" Enable vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Graphiz settings: wannesm/wmgraphviz.vim
let g:WMGraphviz_viewer = 'open'
let g:WMGraphviz_output = 'png'

" vim-terraform settings
let g:terraform_fmt_on_save = 1

" General Settings
set nocompatible          " Running Vim, not Vi
set number                " Always show line numbers
set showmode              " Always show what mode we're currently in
set noswapfile            " It's 2012, Vim. Yep, and they get in the way

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<binding.pry_remote\>"
au BufEnter *.rb syn match error contained "\<debugger\>"

" Whitespace related
set nowrap                " No word wrap
set tabstop=2             " A tab is two spaces
set shiftwidth=2          " number of spaces to use for auto indenting
set softtabstop=2         " how many columns vim uses when hitting tab in insert mode
set expandtab             " convert tabs into appropriate number of spaces
set paste                 " copies in test from outside sources correctly

" Search
set hlsearch              " Highlight searches
set ignorecase            " Ignore case in searches
set smartcase             " smartcase make /-style searches case-sensitive only if there is capital n the search expression

" Status Bar
set statusline=%t\ %r\ %y\ format:\ %{&ff};\ [%c,%l]  " Format statusbar http://vim.runpaint.org/display/changing-status-line/

" NerdTREE settings
let NERDTreeShowHidden=1             " Show hidden files

" " Mappings
let mapleader = ","                  " Set leader key
map <leader>nt :NERDTree<CR>         " Set NERDTree shortcut
map <leader>ev :e $MYVIMRC<CR>       " Quickly edit the vimrc file
map <leader>sv :so $MYVIMRC<CR>      " Quickly reload the vimrc file
map <leader>cs :noh<cr>

" easier window switching
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>

" File Types
filetype on                 " Enable filetype detection
filetype indent on          " Enable filetype-specific indenting
filetype plugin indent on
syntax on                   " Enable syntax highlightint
set autoread                " Reload a file when it has been changed outside of vim
set autowrite               " Automatically save before commands like :next and :make
set showmatch               " Show matching brackets.
set spelllang=en_us         " Make vim speak 'merican

" Rabl settings
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.rabl syn keyword rubyRabl node attribute object child collection attributes glue extends
au BufRead,BufNewFile *.rabl hi def link rubyRabl Function

" File formatting
au BufRead,BufNewFile *.jbuilder setf ruby
au BufRead,BufNewFile *.chef setf ruby
au BufRead,BufNewFile {Berksfile,Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif
