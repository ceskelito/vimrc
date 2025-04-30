call plug#begin('~/.vim/plugged')

" ADD PLUGINS YOU LIKE
Plug 'preservim/nerdtree'      " Lateral file explorer
Plug 'tpope/vim-fugitive'      " Git integration
Plug 'morhetz/gruvbox'         " Gruvbox theme (dark)
"Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
"Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'justinmk/vim-sneak'

call plug#end()

" Set the Gruvbox theme
colorscheme gruvbox
" Set anti-aliasing for fonts
set guifont=Monospace\ 12

" --- Handy configurations ---

" Map F2 to open/close NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

" When opening Vim without files, open NERDTree
"autocmd VimEnter * if argc() == 0 | NERDTree | endif

" When closing the last file, also close Vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | quit | endif

" Basic config for fugitive
" Open git status with :G
command! G Gstatus

" Optional: some fancy configuration

" Enable syntax highlighting
syntax enable

" Enable relative line numbers for easier navigation
set number

" Set indentation width (use tabs, not spaces)
set noexpandtab
set tabstop=4        " Set tab width to 4 spaces
set shiftwidth=4     " Set auto-indent width to 4 spaces
set softtabstop=4    " Set tab width for auto-indentation to 4 spaces

" For a more modern interface
set background=dark         " Set dark background
set termguicolors           " Enable 24-bit color support
set showcmd                 " Show current typed command
set cursorline              " Highlight the current line
set wildmenu                " Dropdown menu for command completion

" Prevent creation of unnecessary swap files
set noswapfile

" Automatically save file before exiting
"autocmd BufLeave * silent! write

" Open files with vertical splits
set splitright

" Easily navigate between split files
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Use Alt+v to split files
nnoremap <Esc>v :vsplit<CR>

" Use space instead of enter in NERDTree list
autocmd FileType nerdtree nmap <buffer> <Space> <CR>

" Automatically move the cursor to the last position it was before closing the file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
