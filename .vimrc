" Basic Configuration
" ===================
set nocompatible               " dump the old fashioned vi support!
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set backup                     " keep a backup file
set backupdir=~/.backup        " custom backup directory
set history=5000               " keep 5000 lines of command line history
set ruler                      " show the cursor position all the time
set showcmd                    " display incomplete commands
set mouse=a                    " enable the mouse
set lazyredraw                 " don't update the display while executing macros
set showmode                   " so you know what mode you are in
set laststatus=2               " always put a status line in.
set scrolloff=5               " start scrolling 5 lines from the top/bottom
set ch=1                       " set command line 1 lines high
set nowrap                     " no line wrapping 
set shiftwidth=4               " round indent actions to multiple of 4
set softtabstop=4              " soft tabs = 4 spaces 
set tabstop=4                  " tabs = 4 spaces
set expandtab                  " expand tabs to spaces
set incsearch                  " do incremental searching
set hlsearch                   " highlight search terms
set ignorecase                 " case insensitive search
set gdefault                   " replace all instances on line when doing global search/replace
set number                     " enable line numbers
set showmatch                  " show matching parenthesis
set hidden                     " allow hidden buffers with unsaved changes
set whichwrap+=<,>,[,]         " allow arrow keys to line wrap
set wildmenu                   " enable enhanced command line completion
set wildignore+=*.pui,*.prj    " ignore these when completing file or directory names
set ttyfast                    " faster terminal updates
set virtualedit+=block         " allow virtual-block select to go past end of lines
syntax on                      " enable syntax highlighting

" For fancy color settings
" =======================
" Use l to toggle display of whitespace
nmap l :set list!              

" And set some nice chars to do it with
set listchars=tab:»\ ,eol:¬
set term=xterm-256color

" More subtle popup colors
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
endif

" From Previous file
" ==================
" Cross check these and remove un-necessary ones
set undolevels=5000
set ic!
set title
set cindent
set autochdir
" set spell
set visualbell
set noerrorbells
set autoread
set magic
set foldenable
set autoindent
set bg=dark
highlight normal guifg=white guibg=black
:au FocusLost * silent! wa

" NERDTree settings
" ================================================
" To open NERDTree when vim starts
autocmd vimenter * NERDTree
" To open NERDTree when vim starts w/o any file
autocmd vimenter * if !argc() | NERDTree | endif
" To close NERTree when no file exists in vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" All Plugin key mappings
" ======================
map <C-n> :NERDTreeToggle<CR>

" Return to last edit position when opening files
" ===============================================
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

au FileType xml,html,xhtml let b:delimitMate_matchpairs = "(:),[:],{:}"

" For Mapping Ctrl-space to Ctrl-p
" ================================
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
      \ "\<lt>C-n>" :
      \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
      \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
      \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>


" Colors
" ======
set t_Co=256

" Easy edit/open commands
" =======================
command EditVim  :edit   ~/.vimrc
command EditBash :edit   ~/.bashrc

" My favorite mappings
" ====================
map <C-v> "+gp
map <C-t> :tabnew
map <C-f> gg=G
map <C-o> :browse e
map <C-a> ggVG
inoremap <C-Space> <C-p>

map <F11>   :ZoomWin<CR>
map <F12>   :noh<CR>

" WINDOW MANAGEMENT
" ================
map <Bar>   <C-W>v<C-W><Right>
map -       <C-W>s<C-W><Down>
map <Tab>   <C-W>w
map <Esc>[Z <C-W>W
map <C-c>   <C-W>c

" Operations to do while opening new/old cpp files
" ================================================
autocmd bufnewfile *.cpp so /home/sabari/Templates/headers/cpp.txt
autocmd bufnewfile *.cpp exe "1," . 13 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.cpp exe "1," . 13 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.cpp execute "normal ma"
autocmd Bufwritepre,filewritepre *.cpp exe "1," . 13 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.cpp execute "normal `a"

" Operations to do while opening new/old files
" ============================================
autocmd bufnewfile *.c so /home/sabari/Templates/headers/c.txt
autocmd bufnewfile *.c exe "1," . 13 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.c exe "1," . 13 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 13 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.c execute "normal `a"

" TagBar Plugin Configuration
" ===========================
nmap <F2> :TagbarToggle<CR>

" Vundle Configuration
" ====================
filetype off                    " Required before running BundleInstall

set rtp+=~/.vim/bundle/vundle/  " Folder containing the main vundle repository

call vundle#rc()                " To invoke vundle

" Main vundle repo 
Bundle 'gmarik/vundle'          

" Begin -- vim plugins by users
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'Rip-Rip/clang_complete'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
" End - vim plugins by users

" Begin -- vim plugins by vim-scripts
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'matchit.zip'
" End -- vim plugins by vim-scripts

filetype plugin indent on     " To enable the plugin indent
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"

" To set line width for python files
" ==================================
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

" Powerline setup
" ===============
set guifont=Inconsolata
set laststatus=2

" Python-mode plugin custom configuration
" =======================================
" Keys:
" K             Show python docs
"   Rope autocomplete
" g     Rope goto definition
" d     Rope show documentation
" f     Rope find occurrences
" b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = 'b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
