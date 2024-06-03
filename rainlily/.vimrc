if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
	Plug 'itchyny/lightline.vim'
	Plug 'vim-scripts/vim-gitgutter'
	Plug 'sheerun/vim-polyglot'
  Plug 'altercation/vim-colors-solarized'
call plug#end()

filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized

set hidden

set backspace=indent,eol,start

set number!
set noshowmode
set laststatus=2
set mouse=a