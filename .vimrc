set nocompatible              " be iMproved, required
set encoding=utf-8
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Code autocompletion
Plugin 'Valloric/YouCompleteMe'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Vim Airline
Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
execute pathogen#infect()

set showmatch
set number
set mouse=a
set visualbell
set t_vb=
set tabstop=4
set expandtab
set shiftwidth=4
set backspace=indent,eol,start

" NerdTree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * NERDTree | wincmd p

syntax on

let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1 

" nim autocompletion
au BufNewFile,BufRead *.nim set filetype=nim

"" Important!!
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"" The configuration options should be placed before `colorscheme edge`.
let g:edge_style = 'aura'
let g:edge_enable_italic = 0
let g:edge_disable_italic_comment = 1

set background=dark
colorscheme edge

" Airline
let g:airline_powerline_fonts = 1

" Vim ALE Linting
let g:ale_sign_error = '⬤'
let g:ale_sign_warning = '🠶'
let g:ale_sign_info = '🗩'
let g:ale_sign_style_error = '◦'
let g:ale_sign_style_warning = '.'

" Let airline display status messages
let g:airline#extensions#ale#enabled = 1

" Ignore line too long syntax 'errors'
let g:ale_python_flake8_options = '--ignore=E501' 


" YCM
let g:ycm_python_interpreter_path = system('which python')
let g:ycm_python_sys_path = ['/usr/bin/python']
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
