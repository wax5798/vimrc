filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim_runtime/bundle/Vundle.vim
call vundle#begin('~/.vim_runtime/bundle')

" VundleVim/Vundle.vim BEGIN
" Vundle: let Vundle manage Vundle, required
Plugin 'wax5798/Vundle.vim'
" VundleVim/Vundle.vim END

" mileszs/ack.vim BEGIN
" ack.vim: a search tool
" using 'apt-get install silversearcher-ag' to install ag or 'apt-get install ack-grep' to install ack
Plugin 'wax5798/ack.vim'
nnoremap <F4> viw"zy:Ack! '\b<C-r>z\b' ./ --ignore "*.txt"
vnoremap <F4> "zy:Ack! '<C-r>z' ./ --ignore "*.txt"
cnoremap <F4> Ack! -i '' ./<LEFT><LEFT><LEFT><LEFT>
if executable('ag')
  let g:ackprg = 'ag -s --nopager --nocolor --nogroup --column'
endif
" mileszs/ack.vim END

"junegunn/goyo.vim BEGIN
" goyo: Distraction-free writing in Vim 
" Usage - :Goyo [to Toggle Goyo]
Plugin 'wax5798/goyo.vim'
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
" junegunn/goyo.vim END

" amix/vim-zenroom2 BEGIN
" vim-zenroom2: A Vim extension that emulates iA Writer environment when editing Markdown, reStructuredText or text files 
Plugin 'wax5798/vim-zenroom2'
" amix/vim-zenroom2 END

" scrooloose/nerdtree BEGIN
" nerdtree: A tree explorer plugin for vim
Plugin 'wax5798/nerdtree'
let NERDTreeIgnore=['.*\.pyc$','.*\.o$','.*\.ko$','.*\.so','.*\.a','.*\.swp','.*\.tar','.*\.tar\..*','.*\.zip']  
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=35
" 列出当前目录文件
nnoremap <silent> <F3> :NERDTreeToggle<CR>
" scrooloose/nerdtree END

" w0rp/ale BEGIN
" ale: Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
Plugin 'wax5798/ale'
" let g:ale_set_highlights = 0    " Disabling highlighting
let g:ale_lint_on_text_changed = 'never' " Only run linting when saving the file
" let g:ale_lint_on_enter = 0    " don't let linters to run on opening a file
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
" w0rp/ale END

" tpope/vim-fugitive BEGIN
Plugin 'wax5798/vim-fugitive'                 
" tpope/vim-fugitive END

" Yggdroot/indentLine BEGIN
Plugin 'wax5798/indentLine'
let g:indentLine_char='┊'                 " this feature only works with files whose encoding is UTF-8
" Yggdroot/indentLine END

" EasyMotion BEGIN
Plugin 'EasyMotion'
let g:EasyMotion_leader_key='<Space>'
" EasyMotion END

" kien/ctrlp.vim BEGIN
" 使用<C-p>调用CtrlP, 帮助条目:ctrlp-commands, ctrlp-extensions, ctrlp-mappings, ctrlp-options
Plugin 'wax5798/ctrlp.vim'
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_by_filename = 1
nmap <Leader>pb :CtrlPBuffer<CR>
nmap <Leader>pp :CtrlP<CR>
nmap <Leader>pm :CtrlPMRU<CR>
" if executable('ag')
"   let g:ctrlp_user_command = 'ag %s -l –nocolor –hidden ./'
" endif
" kien/ctrlp.vim END

" junegunn/fzf BEGIN
" Plugin 'wax5798/fzf'
" junegunn/fzf END

" majutsushi/tagbar BEGIN
" Plugin 'wax5798/tagbar'
" let g:tagbar_width=35
" let g:tagbar_autofocus=0
" nmap <F6> :TagbarToggle<CR>
" majutsushi/tagbar END

" scrooloose/nerdcommenter BEGIN
" Vim plugin for intensely orgasmic commenting
" usage:[count]<leader>c<space> |NERDComToggleComment|
Plugin 'wax5798/nerdcommenter'
let g:NERDSpaceDelims = 1       " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1   " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1    " Set a language to use its alternate delimiters by default
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }   " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1    " Enable trimming of trailing whitespace when uncommenting
" scrooloose/nerdcommenter END

" vim-airline/vim-airline BEGIN
" lean & mean status/tabline for vim that's light as air
Plugin 'wax5798/vim-airline'
Plugin 'wax5798/vim-airline-themes'

let g:airline_theme='molokai'                           " 配置主题：https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline#extensions#tabline#enabled = 1            " Smarter tab line
let g:airline#extensions#tabline#buffer_nr_show = 1     " 显示buffer的序号
let g:airline_powerline_fonts = 1                       " 以下配置分隔符，需要安装powerline字体
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'                           
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
" vim-airline END

" vim-markdown BEGIN
" Syntax highlighting, matching rules and mappings for the original Markdown and extensions
Plugin 'wax5798/tabular'
Plugin 'wax5798/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
" vim-markdown END

" vim-instant-markdown BEGIN
" Instant Markdown previews from vim
" Plugin 'wax5798/vim-instant-markdown'
" let g:instant_markdown_autostart = 1
" nnoremap <Leader>mc O<div align="center"><ESC>jo</div><ESC>
" vim-instant-markdown END

" markdown-preview.vim BEGIN
" MarkdownPreview
Plugin 'wax5798/markdown-preview.vim'
let g:mkdp_path_to_chrome = "firefox"
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
" markdown-preview.vim END

" Shougo/neocomplete.vim BEGIN
Plugin 'wax5798/neocomplete.vim'
source ~/.vim_runtime/vimrcs/plugins_config_neocomplete.vim
" Shougo/neocomplete.vim END

" ervandew/supertab BEGIN
Plugin 'wax5798/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"
" ervandew/supertab  END

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
