set relativenumber
set clipboard=unnamedplus,autoselect " Use + register (X Window clipboard) as unnamed register
" set paste               " Paste from a windows or from vim
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a
set whichwrap+=<,>,[,] " right move in the first char of non first line move to end of previous line
set foldmethod=syntax
set foldlevel=9999

call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-obsession'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

if has('gui_running')
	Plug 'drmikehenry/vim-fontsize'
endif

call plug#end()

" colorscheme
"
" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  set termguicolors
endif

" colo slate
let g:seoul256_background = 233 " Range:   233 (darkest) ~ 239 (lightest)
colo seoul256

" fzf
let g:fzf_layout = { 'down': '~40%' }

" keybindings
let mapleader=" "

" finders
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <silent> <Leader>/ :Rg<CR>

" windows
nnoremap <leader>w <C-w>
nnoremap <leader>- <C-w>s<C-w>w
nnoremap <leader>\| <C-w>v<C-w>w
nnoremap <leader>wd <C-w>c<C-w>w
nnoremap <leader>wm :MaximizerToggle<CR>
nnoremap <C-S-j> :resize +2<CR>
nnoremap <C-S-k> :resize -2<CR>
nnoremap <C-S-l> :vertical resize +5<CR>
nnoremap <C-S-h> :vertical resize -5<CR>

" sessions
nnoremap <leader>qs :source ./Session.vim<CR>

" exit
nnoremap <leader>qq :qa<CR>

" config
nnoremap <C-,> :e ~/.vimrc<CR>

" buffers
nnoremap <leader>bd :bd<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>

" wrap
nnoremap <leader>uw :set wrap!<CR>

" colorscheme
nnoremap <leader>c] :call NextColor()<CR>
nnoremap <leader>c[ :call PrevColor()<CR>

" better navigation up/bottom
noremap <expr> j (v:count? 'j' : 'gj')
noremap <expr> k (v:count? 'k' : 'gk')

" Crear una lista de todos los esquemas de colores
let s:colors = getcompletion('', 'color')
let s:current_color = 0

" Función para avanzar al siguiente esquema de colores
function! NextColor()
    let s:current_color = (s:current_color + 1) % len(s:colors)
    exec 'colorscheme ' . s:colors[s:current_color]
    redraw!
    echo "colorscheme " . s:colors[s:current_color] . ""
endfunction

" Función para retroceder al esquema de colores anterior
function! PrevColor()
    let s:current_color = (s:current_color - 1 + len(s:colors)) % len(s:colors)
    exec 'colorscheme ' . s:colors[s:current_color]
    echo 'Colorscheme: ' . s:colors[s:current_color]
endfunction

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
