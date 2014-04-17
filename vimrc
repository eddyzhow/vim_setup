execute pathogen#infect()
" Make CoffeeScript command work
filetype plugin indent on

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight search configuration
set hlsearch
set ignorecase
set smartcase
set incsearch

" NERDTree configuration
autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0
map  <S-l> :tabn<CR>
map  <S-h> :tabp<CR>
map  <S-n> :tabnew<CR>

" Kolor theme configuration
set t_Co=256
colorscheme kolor

" jslint2 configuration
let jshint2_save=1

" T-comment configuration
map <leader>c <c-_><c-_>

" powerline configuration
let g:airline_powerline_fonts = 1

" Set line number
set nu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0

" always reload buffer when external changes detected
set autoread
" this enables "visual" wrapping
set wrap

" easier navigation between split windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Remove trailing whitespace
nnoremap <silent> <leader>1 :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
               \ endif

" Command aliases for saving
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is#'WQ')?('wq'):('WQ'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> Qa ((getcmdtype() is# ':' && getcmdline() is#'Qa')?('qa'):('Qa'))
cnoreabbrev <expr> QA ((getcmdtype() is# ':' && getcmdline() is#'QA')?('qa'):('QA'))

" Make the 80th column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%80v', 100)

" Toggle visibility of naughty characters
" Make naughty characters visible...
" (uBB is right double angle, uB7 is middle dot)
exec "set lcs=tab:\uBB\uBB,trail:\uB7,nbsp:~"
augroup VisibleNaughtiness
    autocmd!
    autocmd BufEnter * set list
    autocmd BufEnter *.txt set nolist
    autocmd BufEnter *.vp* set nolist
    autocmd BufEnter * if !&modifiable
    autocmd BufEnter * set nolist
    autocmd BufEnter * endif
augroup END

" Ignore certain type of files in NERDTree
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]

" Tagbar
"{
    let g:tagbar_autoclose = 1
    let g:tagbar_autofocus = 1
    nnoremap <silent> <leader>t :TagbarToggle<CR>
"}

" Flask8 syntax and style validation
" Don't know why they put thing in ftplugin/ instead of just plugin/
so ~/.vim/bundle/vim-flake8/ftplugin/python_flake8.vim
autocmd FileType python map <buffer> <F8> :call Flake8()<CR>
autocmd BufWritePost *.py call Flake8()

" Make vim CoffeeScript friendly
" folding is disabled by default 
" but can be quickly toggled per-file by hitting zi
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.coffee setl tabstop=2 shiftwidth=2
