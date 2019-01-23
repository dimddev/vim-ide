" ********************************************************************************************************
" GLOBAL SETTINGS
set nocompatible              " be iMproved, required
filetype off                  " required
set splitright
set encoding=utf-8
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set number
set autoindent
set cursorline
set synmaxcol=120
set hlsearch
set nowrap
set smartcase
set backupcopy=yes
set autoread
set backupdir=~/.cache/vim
set dir=~/.cache/vim
set history=1000
set updatetime=1300

" ********************************************************************************************************
" LOCAL SETTINGS
setlocal spell spelllang=en

" ********************************************************************************************************
" RUNTIME VIM MACROS
runtime macros/matchit.vim

" ********************************************************************************************************
" THE PLUGIN LOADER IS PLUG
call plug#begin('~/.vim/plugged')

" ********************************************************************************************************
" PLUGINS LIST START HERE, THE GLOBAL ONES ARE FIRST
Plug 'easymotion/vim-easymotion'
Plug '907th/vim-auto-save'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Raimondi/delimitMate'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'powerline/powerline',               {'rtp': 'powerline/bindings/vim/'}

" ********************************************************************************************************
" MULTI DEVELOPMENT PLUGINS
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic',           { 'for': ['python', 'ruby', 'javascript'] }
Plug 'flazz/vim-colorschemes',            { 'for': ['python', 'ruby', 'javascript'] }
Plug 'Valloric/YouCompleteMe',            { 'for': ['python', 'ruby', 'javascript'] }
Plug 'SirVer/ultisnips',                  { 'for': ['python', 'ruby', 'javascript'] }
Plug 'honza/vim-snippets',                { 'for': ['python', 'ruby', 'javascript'] }
Plug 'craigemery/vim-autotag',            { 'for': ['python', 'ruby', 'javascript'] }

" ********************************************************************************************************
" PYTHON
Plug 'jmcantrell/vim-virtualenv',         { 'for': 'python' }
Plug 'heavenshell/vim-pydocstring',       { 'for': 'python' }

" ********************************************************************************************************
" SYSTEM LANGUAGES
Plug 'octol/vim-cpp-enhanced-highlight',  { 'for': 'cpp' }
Plug 'rust-lang/rust.vim',                { 'for': 'rust' }

" ********************************************************************************************************
" FRONTEND
Plug 'othree/html5.vim',                  { 'for': 'html' }
Plug 'mxw/vim-jsx',                       { 'for': 'javascript' }

" ********************************************************************************************************
" RUBY
Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
Plug 'tpope/vim-rails',                   { 'for': 'ruby' }
Plug 'tpope/vim-rbenv',                   { 'for': 'ruby' }
Plug 'tpope/vim-bundler',                 { 'for': 'ruby' }
Plug 'tpope/vim-endwise',                 { 'for': 'ruby' }
Plug 'slim-template/vim-slim',            { 'for': 'ruby' }
Plug 'benmills/vimux',                    { 'for': 'ruby' }
Plug 'skalnik/vim-vroom',                 { 'for': 'ruby' }

" ALL OF YOUR PLUGINS MUST BE ADDED BEFORE THE FOLLOWING LINE
" INITIALIZE PLUGIN SYSTEM
call plug#end()

filetype plugin indent on    " required

" ********************************************************************************************************
" YOUCOMPLETEME
let g:ycm_collect_identifiers_from_tags_files = 1       " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1                   " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1              " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1                      " Completion in comments
let g:ycm_complete_in_strings = 1                       " Completion in string
let g:ycm_autoclose_preview_window_after_completion = 1

" ********************************************************************************************************
" AUTO SAVE
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" ********************************************************************************************************
" ULTISNIPS
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

" ********************************************************************************************************
" POWERLINE SETUP
set t_Co=256
set laststatus=2
set term=xterm-256color
set termencoding=utf-8
set guifont=Ubuntu\ Mono\ derivative\

" ********************************************************************************************************
" AIRLINE THEME
let g:airline_theme='murmur'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" ********************************************************************************************************
" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{virtualenv#statusline()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_jump = 0
let g:syntastic_aggregate_errors = 1

" ********************************************************************************************************
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

" ********************************************************************************************************
" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

let g:ctrlp_by_filename = 1
let g:ctrlp_use_caching = 1
" let g:ctrlp_regexp = 1
let g:ctrlp_dotfiles = 0
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 100
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
set wildignore+=*/.git/*
nnoremap <leader>. :CtrlPTag<CR>

" ********************************************************************************************************
" VIM-COLORS
colorscheme badwolf

" ********************************************************************************************************
" JSX
let g:jsx_ext_required = 0 " Allow JSX in normal JS files"

" ********************************************************************************************************
" VIMUX
map <Leader>z :call VimuxZoomRunner()<CR>
map <Leader>x :call VimuxCloseRunner()<CR>
map <Leader>c :call VimuxOpenRunner()<CR>

" ********************************************************************************************************
" VROOM
let g:vroom_use_colors = 1
let g:vroom_use_vimux = 1
let g:vroom_detect_spec_helper = 1
let g:vroom_spec_command = 'rspec -fd '
" ********************************************************************************************************
" SHORTCUTS

" will make formatted text
nnoremap <Leader>p ggvGgq

" ********************************************************************************************************
" SPELLING RULES
fun! SetSpellingColors()
  highlight SpellBad cterm=bold ctermfg=white ctermbg=red
  highlight SpellCap cterm=bold ctermfg=red ctermbg=white
endfun

augroup spellrulez
  autocmd!
  autocmd BufWinEnter *.txt call SetSpellingColors()
  autocmd BufNewFile *.txt call SetSpellingColors()
  autocmd BufRead *.txt call SetSpellingColors()
  autocmd InsertEnter *.txt call SetSpellingColors()
  autocmd InsertLeave *.txt call SetSpellingColors()
  autocmd BufWritePost *.txt call SetSpellingColors()
augroup END

" ********************************************************************************************************
" Transparent editing of GnuPG-encrypted files
" Written by Patrick R. McDonald at https://www.antagonism.org/privacy/gpg-vi.shtml
" Based on a solution by Wouter Hanegraaff
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre     *.gpg,*.asc set viminfo=
  " We don't want a swap file, as it writes unencrypted data to disk.
  autocmd BufReadPre,FileReadPre     *.gpg,*.asc set noswapfile
  " Switch to binary mode to read the encrypted file.
  autocmd BufReadPre,FileReadPre     *.gpg       set bin
  autocmd BufReadPre,FileReadPre     *.gpg,*.asc let ch_save = &ch|set ch=2
  autocmd BufReadPost,FileReadPost   *.gpg,*.asc '[,']!sh -c 'gpg --decrypt 2> /dev/null'
  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost   *.gpg       set nobin
  autocmd BufReadPost,FileReadPost   *.gpg,*.asc let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost   *.gpg,*.asc execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  autocmd BufWritePre,FileWritePre   *.gpg set bin
  autocmd BufWritePre,FileWritePre   *.gpg '[,']!sh -c 'gpg --default-recipient-self -e 2>/dev/null'
  autocmd BufWritePre,FileWritePre   *.asc '[,']!sh -c 'gpg --default-recipient-self -e -a 2>/dev/null'
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg,*.asc u
augroup END

" ********************************************************************************************************
" automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert

" ********************************************************************************************************
autocmd FileType python setlocal ts=4 sw=4 softtabstop=4

" ********************************************************************************************************
" RUN RSPEC ON SAVE
" autocmd BufWritePost *.rb VroomRunTestFile

" ********************************************************************************************************
" UPDATE CTAGS ON SAVE
autocmd BufWritePost *
  \ if filereadable('tags') |
  \  call system('ctags -a '.expand('%')) |
  \ endif
