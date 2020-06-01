syntax on

set laststatus=2
set statusline=%f
set timeoutlen=1000 ttimeoutlen=0
set belloff=all
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80
highligh ColorColumn ctermbg=0

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'kana/vim-fakeclip'
Plug 'valloric/matchtagalways'
call plug#end()

let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ycm_autoclose_preview_window_after_insertion=1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize = 25


let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall

let g:ctrlp_use_caching=0

nnoremap <CR> :nohlsearch<CR><CR>

"Surrounding curyl braces
inoremap {<CR> {<CR>}<Esc>O
inoremap ><space>{<CR> ><space>{<CR>});<Esc>O

"Pane navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"Open NERDTree
nnoremap <leader>pv :NERDTreeToggle<CR>
"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

"RipGrep
nnoremap <leader>ps :Rg<SPACE>
"test
"Resize panes 
nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

"YouCompleteMe commands
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

"Tab Navigation
nnoremap H gT
nnoremap L gt

"Save All
nnoremap <Leader>s :wa<CR>

"HTML Skip Line
nnoremap <Leader><CR> i<CR><Esc>O 
