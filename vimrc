execute pathogen#infect()
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

" Kolor theme configuration
set t_Co=256
colorscheme kolor

