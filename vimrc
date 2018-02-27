"
" 00-plugins.vim: load plugins before any other settings
"

call plug#begin('~/.config/nvim/bundles')

Plug 'Shougo/unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-sensible'

Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot'
" More text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'glts/vim-textobj-comment'
Plug 'rhysd/vim-textobj-continuous-line'
Plug 'adriaanzon/vim-textobj-matchit'

Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'

" Markdown: markdown writing environment with pandoc
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'vim-pandoc/vim-pandoc'

" Latex: latex plugins
Plug 'lervag/vimtex'

" VimAirline: powerline replacement
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'

" vim for writers
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-thematic'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-wheel'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

Plug 'jnurmine/Zenburn'
Plug 'Lokaltog/vim-distinguished'
Plug 'joshdick/onedark.vim'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'w0rp/ale'
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': ['c', 'cpp'] }

Plug 'Valloric/YouCompleteMe', {
         \ 'for': ['c', 'cpp', 'python'],
         \ 'do': './install.py --clang-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'ajh17/VimCompletesMe'
Plug 'autozimu/LanguageClient-neovim', {
         \ 'branch': 'next',
         \ 'do': 'bash install.sh',
         \ }
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'Chiel92/vim-autoformat'

Plug 'KabbAmine/zeavim.vim'
Plug 'rizzatti/dash.vim'

call plug#helptags()
call plug#end()
