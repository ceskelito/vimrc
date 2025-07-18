call plug#begin('~/.vim/plugged')

" ADD PLUGINS YOU LIKE
Plug 'preservim/nerdtree'      " Lateral file explorer
Plug 'tpope/vim-fugitive'      " Git integration
Plug 'morhetz/gruvbox'         " Gruvbox theme (dark)
"Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'justinmk/vim-sneak'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'iaalm/terminal-drawer.vim'	" Toggle terminal, default <C-t>

call plug#end()

" Add paths for include files to enable autocompletion
set path+=**/*.h

" Ignore .git directories in wildmenu completions
set wildignore+=*/.git/*

" Set up autocompletion for C and C++ files
autocmd FileType c,cpp setlocal omnifunc=ccomplete#Complete

" if use ctgas too:
set tags=./tags;,tags;

" Terminal Drawer Settings
let g:terminal_drawer_shell = "zsh"			" Set the terminal shell. To not overload 'shell' variable
let g:terminal_drawer_leader = "<C-\\>"		" Change bindning. Default: <C-t>
let g:terminal_drawer_position = "bottom"	" Set the terminal drawer position. Can be neither 'bottom' or 'top'
let g:terminal_drawer_size = 20				" Set the terminal drawer size

" Open the terminal drawer in insert mode too
inoremap <C-\> <Esc>:ToggleTerminalDrawer<CR>
" Set the shorcut to close (not hide) the terminal
tnoremap <C-K> <C-w>:q!<CR>

" Set the Gruvbox theme
colorscheme gruvbox
" Set anti-aliasing for fonts
set guifont=Monospace\ 12

" --- Handy configurations ---

" Map Ctrl+S to save
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

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

"let g:UltiSnipsExpandTrigger="<tab>"


function! GenCanonical(name)
    let l:class = a:name

    " Generate Orthodox Canonical Form .hpp file
    execute "edit " . l:class . ".hpp"
    call setline(1, [
    \ '#ifndef ' . toupper(l:class) . '_HPP',
    \ '#define ' . toupper(l:class) . '_HPP',
    \ '',
	\ '#include <iostream>',
    \ '',
    \ 'class ' . l:class . ' {',
    \ 'public:',
    \ '    ' . l:class . '();',
    \ '    ' . l:class . '(const ' . l:class . '& other);',
    \ '    ' . l:class . '& operator=(const ' . l:class . '& other);',
    \ '    ~' . l:class . '();',
    \ '',
    \ 'private:',
    \ '',
    \ '};',
    \ '',
    \ '#endif'
    \ ])

    " Generate Orthodox Canonical Form .cpp file
	execute "vsplit " . l:class . ".cpp"
	call setline(1, [
	\ '#include "' . l:class . '.hpp"',
	\ '',
	\ l:class . '::' . l:class . '() {',
	\ '    std::cout << "' . l:class . ' constructed" << std::endl;',
	\ '}',
	\ '',
	\ l:class . '::' . l:class . '(const ' . l:class . '& other) {',
	\ '    std::cout << "' . l:class . ' copied" << std::endl;',
	\ '    *this = other;',
	\ '}',
	\ '',
	\ l:class . '& ' . l:class . '::operator=(const ' . l:class . '& other) {',
	\ '    std::cout << "' . l:class . ' assigned" << std::endl;',
	\ '    if (this != &other) {',
	\ '        // copy fields here',
	\ '    }',
	\ '    return *this;',
	\ '}',
	\ '',
	\ l:class . '::~' . l:class . '() {',
	\ '    std::cout << "' . l:class . ' destructed" << std::endl;',
	\ '}'
	\ ])

endfunction

"Command used to generate canonical files: :canonical file-name
command! -nargs=1 Canonical call GenCanonical(<f-args>)
cabbrev canonical Canonical

"by https://github.com/Eutrius
nnoremap ;; :buffers<CR>:let b=input('') \| :exec 'buffer '.(b == '' ? '#' : b)<CR>

" Mapping: \r → prompts for what to search and what to replace
nnoremap <Leader>r :call Replace()<CR>

" Command: :ReplaceText old new → performs the substitution
command! -nargs=+ ReplaceText execute '%s/' . <f-args> . '/g'

" Function: prompts for input for the substitution
function! Replace()
  let old = input("Search: ")
  let new = input("Replace with: ")
  execute '%s/' . escape(old, '/\') . '/' . escape(new, '/\') . '/g'
endfunction
