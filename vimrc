set runtimepath+=~/.config/vim/bundles/neobundle.vim
call neobundle#begin(expand('~/.config/vim/bundles'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Raimondi/delimitMate'

NeoBundle 'godlygeek/tabular'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'vim-pandoc/vim-pandoc-syntax'
NeoBundle 'vim-pandoc/vim-pandoc-after'
NeoBundle 'vim-pandoc/vim-pandoc'

" VimAirline: powerline replacement
" Note: disabled in favor of unified powerline, but this is useful for inspur
" or yh where python is slow and low version.
" NeoBundle 'bling/vim-airline'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'edkolev/promptline.vim'

NeoBundle 'dahu/vimple'
NeoBundle 'dahu/Asif'
NeoBundle 'vim-scripts/SyntaxRange'
NeoBundle 'ProgramFan/vim-asciidoctor'

" vim for writers
NeoBundle 'reedes/vim-pencil'
NeoBundle 'reedes/vim-thematic'
NeoBundle 'reedes/vim-wordy'
NeoBundle 'reedes/vim-litecorrect'
NeoBundle 'reedes/vim-wheel'
NeoBundle 'junegunn/limelight.vim'
NeoBundle 'junegunn/goyo.vim'

NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'joshdick/onedark.vim'
NeoBundle 'reedes/vim-colors-pencil'
NeoBundle 'ProgramFan/vim-distinguished'
" NeoBundle 'Chiel92/vim-autoformat'

" YouCompleteMe: A super fast and versatile completer
NeoBundle 'Valloric/YouCompleteMe'

" Syntastic: A nice syntax checker and static analysis tool
NeoBundle 'scrooloose/syntastic'

" Doxygen: C/C++ documentation system
NeoBundle 'vim-scripts/DoxygenToolkit.vim'
" python-mode: python ide support, currently only indent is used.
NeoBundle 'klen/python-mode'
NeoBundle 'leshill/vim-json'
" NeoBundle 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'
NeoBundle 'SirVer/ultisnips'

" CodeFormat: code formatter/beautifier
NeoBundle 'google/vim-maktaba'
NeoBundle 'google/vim-glaive'
NeoBundle 'google/vim-codefmt'

NeoBundle 'GCBallesteros/vim-autocite'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'kchmck/vim-coffee-script'

NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'reedes/vim-textobj-sentence'
NeoBundle 'glts/vim-textobj-comment'
NeoBundle 'kana/vim-textobj-datetime'
NeoBundle 'bps/vim-textobj-python'

call neobundle#end()
