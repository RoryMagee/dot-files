set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor=
set relativenumber
set noerrorbells 
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=2
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set updatetime=5
set colorcolumn=80
set splitright
set belloff=all
set autoread
set nohlsearch
set mouse=

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'towolf/vim-helm'
Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'jiangmiao/auto-pairs'
" Plug 'valloric/matchtagalways'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'preservim/nerdtree'
Plug 'puremourning/vimspector'
Plug 'hashivim/vim-terraform'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ziglang/zig.vim'
call plug#end()

luafile ~/dot-files/lua/lsp.lua
luafile ~/dot-files/lua/telescope.lua
 
colorscheme gruvbox

syntax enable

let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize = 25
let g:vimspector_base_dir='/Users/rorymagee/.vim/plugged/vimspector'

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

"Navigation stuff
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <C-j> :cnext<CR>
nnoremap H gT
nnoremap L gt
nnoremap <leader>pv :NERDTreeToggle<CR>


"Lua ish
nnoremap <C-p> :lua require('telescope.builtin').git_files()<cr>
nnoremap <C-o> :lua require('telescope.builtin').find_files()<cr>

"Resize lanes 
nnoremap <silent> <Leader>= :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

"Vim Fugitive Keybindings
nmap <leader>gs :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>ga :G<CR>
nmap <leader>gca :Git commit -v -a<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gbl :Git blame<CR>
nmap <leader>gdf :Git diff<CR>
nmap <leader>gmt :Git mergetool<CR>
nmap <leader>gds :Gdiffsplit<CR>

"Misc
nnoremap <Leader>s :wa<CR>
inoremap jj <esc>
inoremap jk <esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>rln :set invrelativenumber<CR>
nnoremap <leader>rl :source ~/.config/nvim/init.vim <CR>
vnoremap $ $h

" Vimspector Remaps
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>
nnoremap <leader>dc :call vimspector#Continue()<CR>
nnoremap <leader>ds :call vimspector#Stop()<CR>
nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
