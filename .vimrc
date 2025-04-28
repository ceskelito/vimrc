call plug#begin('~/.vim/plugged')

" ADD PLUGINS YOU LIKE
Plug 'preservim/nerdtree'      " lateral File explorer
Plug 'tpope/vim-fugitive'       " Git integration
Plug 'morhetz/gruvbox'     " Tema gruvbox (scuro)
"Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
"Plug 'ycm-core/YouCompleteMe'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'justinmk/vim-sneak'

call plug#end()

" Imposta il tema gruvbox
colorscheme gruvbox
" Imposta l'anti-aliasing per i font
set guifont=Monospace\ 12


" --- Configurazioni comode ---

" Mappa F2 per aprire/chiudere NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

" Quando apro Vim senza file, apri NERDTree
"autocmd VimEnter * if argc() == 0 | NERDTree | endif

" Quando chiudo l'ultimo file, chiudi anche Vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | quit | endif

" Config base per fugitive
" Apre lo status git con :G
command! G Gstatus


" Optional: some fancy configuration

" Attiva la colorazione della sintassi
syntax enable

" Attiva i numeri relativi per una navigazione più comoda
set number

" Imposta la larghezza per l'indentazione (utilizza tabulazioni, non spazi)
set noexpandtab
set tabstop=4        " Imposta la larghezza della tabulazione a 4 spazi
set shiftwidth=4     " Imposta la larghezza dell'indentazione automatica a 4 spazi
set softtabstop=4    " Imposta la larghezza del tab per l'autoindentazione a 4 spazi

" Per un'interfaccia più moderna
set background=dark         " Imposta il background scuro
set termguicolors           " Usa i colori a 24 bit
set showcmd                 " Mostra il comando in corso di digitazione
"set cursorline              " Evidenzia la riga corrente
set wildmenu                " Menu a discesa per completamento


" Impedisce di creare file di swap inutili
set noswapfile

" Salva il file automaticamente prima di uscire
"autocmd BufLeave * silent! write

" Apri i file divisi in verticale (split)
set splitright

" Naviga facilmente tra i file divisi
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

