if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
	Plug 'itchyny/lightline.vim'
	Plug 'vim-scripts/vim-gitgutter'
	Plug 'sheerun/vim-polyglot'
call plug#end()

filetype plugin indent on
syntax on
set hidden

set backspace=indent,eol,start

set noshowmode
set laststatus=2

set termguicolors