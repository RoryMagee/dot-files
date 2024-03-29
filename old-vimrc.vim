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
set shiftwidth=4
set nohlsearch
set expandtab 
set hidden
set autoindent
set nu
set nowrap
set splitright
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/nvim-undo
set undofile
set incsearch
set colorcolumn=80
set updatetime=50
set previewheight=5
set nocompatible
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Polyglot config
let g:polyglot_disabled = ['markdown', "sensible", "typescript"]

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'szw/vim-maximizer'
Plug 'morhetz/gruvbox'
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'puremourning/vimspector'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile', 'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale', {'for': ['typescript', 'javascript']}
Plug 'valloric/matchtagalways'
Plug 'tpope/vim-dispatch'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-dadbod'
"Plug 'sheerun/vim-polyglot'
Plug 'reekenx/vim-rename2'
Plug 'towolf/vim-helm'
Plug 'chrisbra/csv.vim'
call plug#end()

filetype plugin on 
filetype indent on 

if executable('rg')
    let g:rg_derive_root='true'
endif

let NERDTreeShowHidden = 1
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS = '--reverse'
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize = 25
let g:OmniSharp_timeout = 5
let g:OmniSharp_server_stdio = 1 
let g:OmniSharp_start_without_solution = 1
let g:OmniSharp_highlighting = 3
let g:airline_powerline_fonts = 1
let g:typescript_indent_disable = 1

let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall

let g:ale_diable_lsp = 1
let g:ale_fixers = { 'javascript': ['eslint'] }
let g:ale_linters = { 'cs': ['OmniSharp'] }

"Navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <leader>' :copen<CR>

"Helpful Ish
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<cr>
nnoremap <C-o> :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>m :MaximizerToggle<CR>
nnoremap <leader>rn :Rename 
nnoremap <leader>rln :set invrelativenumber<CR>

"Open NERDTree
nnoremap <leader>pv :NERDTreeToggle<CR>
nnoremap <leader>ppv :NERDTreeFind<CR>

"Resize lanes 
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

inoremap <expr><S-TAB> pumvisible() ? "\lC-p>" : "\<C-h>"
inoremap  <silent><expr> <C-space> coc#refresh()

"Vim Fugitive Keybindings
nmap <leader>gs :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>ga :G<CR>
nmap <leader>gca :Git commit -v -a<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gbr :GBrowse<CR>
nmap <leader>gbl :Git blame<CR>
nmap <leader>gdf :Git diff<CR>

" Mergetool will add all merge conflicts to a qf list 
" Diffsplit will open a split of the current file
nmap <leader>gmt :Git mergetool<CR>
nmap <leader>gds :Gdiffsplit!<CR>

"Tab Navigation
nnoremap H gT
nnoremap L gt

"Save All
nnoremap <Leader>s :wa<CR>

"HTML Skip Line
nnoremap <Leader><CR> i<CR><Esc>O 

"Misc
inoremap jj <esc>
inoremap jk <esc>
nnoremap n nzz
nnoremap N Nzz

" Copy/Paste Commands
nnoremap <leader>d "_d
vnoremap <leader>d "_d
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>q "+p

"Move Text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Reload vimrc
nnoremap <leader>rl :source ~/.config/nvim/init.vim <CR>

"Coc
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gf <Plug>(coc-fix-current)
nnoremap  <leader>cr :CocRestart<CR>

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

fun! CSharp()
    setlocal ts=2 sts=2 sw=2
    nnoremap <buffer> <Leader>gd :OmniSharpGotoDefinition<CR>
    nnoremap <buffer> <Leader>gr :OmniSharpFindUsages<CR>
    nnoremap <buffer> <Leader>gc :OmniSharpGetCodeActions<CR>
    nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
    nnoremap <buffer> <Leader>gf :OmniSharpFixUsings<CR>
endfun

fun! Yaml()
    setlocal cursorcolumn
    setlocal ts=2 sts=2 sw=2
endfun

autocmd FileType cs :call CSharp()
autocmd FileType yaml,yml :call Yaml()

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    mappings = {

    i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist
        },
    },

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  },
  extensions = {
  fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true
    }
  }
}

require('telescope').load_extension('fzy_native')
EOF
