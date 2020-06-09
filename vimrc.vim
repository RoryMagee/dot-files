syntax on

set laststatus=2
set statusline=%f
set noshowmode
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
highlight ColorColumn ctermbg=0

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
"Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'vim-airline/vim-airline'
Plug 'kana/vim-fakeclip'
Plug 'valloric/matchtagalways'
call plug#end()

let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
set background=dark

filetype indent plugin on

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ycm_autoclose_preview_window_after_insertion=1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize = 25
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_timeout = 5
let g:omnicomplete_fetch_full_documentation = 1
set previewheight=5
let g:OmniSharp_highlighting = 2

let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall
let g:ctrlp_use_caching=0

" Update semantic highlighting on BufEnter, InsertLeave and TextChanged
let g:OmniSharp_highlighting = 2

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
"Resize panes 
nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

"CoC/YcM commands
"fun! GoYCM()
"    nnoremap <buffer> <silent> <Leader>gd :YcmCompleter GoTo<CR>
"    nnoremap <buffer> <silent> <Leader>gf :YcmCompleter FixIt<CR>
"    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
"endfun

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col-1] =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap  <silent><expr> <C-space> coc#refresh()
nmap  <leader>gd <Plug>(coc-definition)
nmap  <leader>gr <Plug>(coc-references)
nnoremap  <leader>cr :CocRestart


"Tab Navigation
nnoremap H gT
nnoremap L gt

"Save All
nnoremap <Leader>s :wa<CR>

"HTML Skip Line
nnoremap <Leader><CR> i<CR><Esc>O 

"jj to escape insert mode
inoremap jj <esc>
