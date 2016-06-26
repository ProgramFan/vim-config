"
" 00-plugins.vim: load plugins before any other settings
"

call plug#begin('~/.vim/bundles')

Plug 'Shougo/unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-jdaddy'
Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'

" Markdown: markdown writing environment with pandoc
Plug 'godlygeek/tabular'
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'vim-pandoc/vim-pandoc'
Plug 'ProgramFan/vim-asciidoctor'

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
Plug 'junegunn/seoul256.vim'
Plug 'Lokaltog/vim-distinguished'
Plug 'joshdick/onedark.vim'
Plug 'joshdick/airline-onedark.vim'

" YouCompleteMe: A super fast and versatile completer
Plug 'Valloric/YouCompleteMe'

" Syntastic: A nice syntax checker and static analysis tool
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': ['c', 'cpp'] }
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'leshill/vim-json', { 'for': 'json' }
Plug 'SirVer/ultisnips'

Plug 'Chiel92/vim-codeformat'

Plug 'GCBallesteros/vim-autocite'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'kchmck/vim-coffee-script'

call plug#end()
