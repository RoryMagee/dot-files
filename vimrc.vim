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
set splitright
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale', {'for': 'cs'}
Plug 'kana/vim-fakeclip'
Plug 'valloric/matchtagalways'
Plug 'tpope/vim-dispatch'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
call plug#end()

filetype plugin indent on 

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS = '--reverse'
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize = 25
let g:OmniSharp_server_stdio = 0 
let g:OmniSharp_timeout = 5
let g:OmniSharp_server_stdio = 1 
let g:OmniSharp_start_without_solution = 1
let g:OmniSharp_highlighting = 3
let g:OmniSharp_timeout = 5
let g:airline_powerline_fonts = 1

let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall

let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

"Pane navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"Helpful Ish
nnoremap <leader>nf :e %:h/
nnoremap <C-p> :GFiles<CR>

"Open NERDTree
nnoremap <leader>pv :NERDTreeToggle<CR>

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

"Vim Fugitive Keybindings
nmap <leader>gl :diffget //3<CR>
nmap <leader>gs :diffget //2<CR>
nmap <leader>ga :G<CR>
nmap <leader>gca :Gcommit -v -a<CR>
nmap <leader>gp :Gpush<CR>

"Tab Navigation
nnoremap H gT
nnoremap L gt

"Save All
nnoremap <Leader>s :wa<CR>

"HTML Skip Line
nnoremap <Leader><CR> i<CR><Esc>O 

"Insert Blank Line Below/Above
nnoremap <Leader>o o<Esc>k
nnoremap <Leader>O O<Esc>j

"jj to escape insert mode
inoremap jj <esc>
inoremap jk <esc>

"Reload vimrc
nnoremap <leader>rl :source ~/.config/nvim/init.vim <CR>

nmap  <leader>gd <Plug>(coc-definition)
nmap  <leader>gr <Plug>(coc-references)
nmap <leader>gf <Plug>(coc-fix-current)
nnoremap  <leader>cr :CocRestart<CR>

fun! CSharp()
    setlocal ts=2 sts=2 sw=2
    nnoremap <buffer> <Leader>gd :OmniSharpGotoDefinition<CR>
    nnoremap <buffer> <Leader>gr :OmniSharpFindUsages<CR>
    nnoremap <buffer> <Leader>gc :OmniSharpGetCodeActions<CR>
    nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
    nnoremap <buffer> <Leader>gf :OmniSharpFixUsings<CR>
endfun

autocmd FileType cs :call CSharp()
