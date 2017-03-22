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
Plug 'junegunn/vim-easy-align'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'vim-pandoc/vim-pandoc'
Plug 'ProgramFan/vim-asciidoctor'

" VimAirline: powerline replacement
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'

Plug 'sheerun/vim-polyglot'

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

" YouCompleteMe: A super fast and versatile completer
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'jeaye/color_coded'

" Syntastic: A nice syntax checker and static analysis tool
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/DoxygenToolkit.vim', { 'for': ['c', 'cpp'] }
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'SirVer/ultisnips'

Plug 'Chiel92/vim-autoformat'

Plug 'GCBallesteros/vim-autocite'
Plug 'tomtom/tcomment_vim'

Plug 'KabbAmine/zeavim.vim'
Plug 'rizzatti/dash.vim'

call plug#end()
