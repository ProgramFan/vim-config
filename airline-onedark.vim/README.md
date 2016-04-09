# airline-onedark.vim

This is a [vim-airline](https://github.com/bling/vim-airline) theme for use with the [joshdick/onedark.vim](https://github.com/joshdick/onedark.vim) colorscheme.

**This theme depends on onedark.vim for its colors, and must therefore be used in conjunction with it.**

This theme works with both color modes available in onedark.vim (16 or 256 colors), as specified in the configuration for onedark.vim.

This theme is based on vim-airline's ["tomorrow" theme](https://github.com/bling/vim-airline/blob/master/autoload/airline/themes/tomorrow.vim).

![airline-onedark.vim Preview](https://raw.github.com/joshdick/airline-onedark.vim/master/preview.png)

Preview image taken using:

* [iTerm2](https://iterm2.com/) terminal emulator on Mac OS X
* 12 pt. [PragmataPro Mono](http://www.fsd.it/fonts/pragmatapro.htm#.VlDa1q6rTOY) font

## Installation

(These instructions assume that vim-airline and onedark.vim are already installed and configured to your liking.)

Place `onedark.vim` in your `~/.vim/autoload/airline/themes/` directory either manually or by using your Vim plug-in manager of choice, then add the following line to your `~/.vimrc`:

    let g:airline_theme='onedark'

