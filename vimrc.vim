syntax on 
set number
set relativenumber
set guicursor=
set laststatus=2
set statusline=%f
set noshowmode
set timeoutlen=1000 ttimeoutlen=0
set belloff=all
set autoread
set noerrorbells
set tabstop=4 softtabstop=4
set nohlsearch
set shiftwidth=4
set expandtab 
set hidden
set autoindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=80
set updatetime=50
set previewheight=5
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/Tabmerge'
Plug 'dense-analysis/ale', {'for': 'cs'}
Plug 'kana/vim-fakeclip'
Plug 'valloric/matchtagalways'
Plug 'tpope/vim-dispatch'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
call plug#end()

let g:gruvbox_contrast_dark='hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection = '0'
colorscheme gruvbox
set background=dark

filetype plugin indent on 

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize = 25
let g:OmniSharp_server_stdio = 0 
let g:OmniSharp_timeout = 5
let g:OmniSharp_server_stdio = 1 
let g:OmniSharp_selector_ui = 'ctrlp'
let g:OmniSharp_start_without_solution = 1
let g:OmniSharp_highlighting = 3
let g:OmniSharp_timeout = 5
let g:airline_powerline_fonts = 1

let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall
let g:ctrlp_use_caching=0


let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

"Pane navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"Create new file
nnoremap <leader>nf :e %:h/
"Open NERDTree
nnoremap <leader>pv :NERDTreeToggle<CR>
"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

"RipGrep
nnoremap <leader>ps :Rg<SPACE>
"Resize panes 
nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

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


"Tab Navigation
nnoremap H gT
nnoremap L gt

"Save All
nnoremap <Leader>s :wa<CR>

"HTML Skip Line
nnoremap <Leader><CR> i<CR><Esc>O 

"jj to escape insert mode
inoremap jj <esc>

"Reload vimrc
nnoremap <leader>rl :source ~/.config/nvim/init.vim <CR>

fun! GoOmnisharp()
    nnoremap <buffer> <Leader>gd :OmniSharpGotoDefinition<CR>
    nnoremap <buffer> <Leader>gr :OmniSharpFindUsages<CR>
    nnoremap <buffer> <Leader>gc :OmniSharpGetCodeActions<CR>
    nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
    nnoremap <buffer> <Leader>gf :OmniSharpFixUsings<CR>

endfun

fun! GoTypescript()
    nmap  <leader>gd <Plug>(coc-definition)
    nmap  <leader>gr <Plug>(coc-references)
    nmap <leader>gf <Plug>(coc-fix-current)
    nnoremap  <leader>cr :CocRestart
endfun

autocmd FileType typescript :call GoTypescript()
autocmd FileType cs :call GoOmnisharp()
