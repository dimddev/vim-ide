set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8
set number
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set cursorline
set synmaxcol=120
set encoding=utf8
set hlsearch
set nowrap
"set ignorecase
set smartcase
set backupcopy=yes
set autoread
set backupdir=~/.cache/vim
set history=1000
set dir=~/.cache/vim
set spell
setlocal spell spelllang=bg,en
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'easymotion/vim-easymotion'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin '907th/vim-auto-save'
Plugin 'craigemery/vim-autotag'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-repeat'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'Raimondi/delimitMate'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rust-lang/rust.vim'
Plugin 'othree/html5.vim'
" Plugin 'powerline/powerline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" YouCompleteMe

let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" Auto Save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]
:"

" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 20

" ultisnips
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Powerline setup
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
set t_Co=256
set laststatus=2
set term=xterm-256color
set termencoding=utf-8
set guifont=Ubuntu\ Mono\ derivative\

" Airline theme

let g:airline_theme='murmur'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{virtualenv#statusline()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_jump = 0

" MOTION
let g:EasyMotion_do_mapping = 0 " Disable default mappings

"Jump to anywhere you want with minimal keystrokes, with just one key
"binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" nerdtree
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

" CtrlP

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" vim-colors
colorscheme badwolf

let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '[%n]'

" c++
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" tabs settings
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
" nnoremap <C-S-tab> :gt<CR>
" nnoremap <C-tab>   :gT<CR>

" shortcuts
nnoremap <Leader>p ggvGgq
nnoremap <Leader>tu 0v$gU
nnoremap <Leader>tl 0v$gu

" autocmd
augroup tabsconf
    autocmd!
    autocmd VimEnter * tab all
    autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'
augroup END

augroup reloadvim
    autocmd!
    autocmd BufWritePost ~/.vimrc   so ~/.vimrc
augroup END

augroup skeleton
    autocmd!
    autocmd BufNewFile *.py 0r ~/.vim/skeleton.py
augroup END

fun! SetSpellingColors()
    highlight SpellBad cterm=bold ctermfg=white ctermbg=red
    highlight SpellCap cterm=bold ctermfg=red ctermbg=white
endfun

augroup spellrulez
    autocmd!
    autocmd BufWinEnter * call SetSpellingColors()
    autocmd BufNewFile * call SetSpellingColors()
    autocmd BufRead * call SetSpellingColors()
    autocmd InsertEnter * call SetSpellingColors()
    autocmd InsertLeave * call SetSpellingColors()
    autocmd BufWritePost * call SetSpellingColors()
augroup END
