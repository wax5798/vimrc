filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim_runtime/bundle/Vundle.vim
call vundle#begin('~/.vim_runtime/bundle')

" VundleVim/Vundle.vim BEGIN
" Vundle: let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" VundleVim/Vundle.vim END

" mileszs/ack.vim BEGIN
" ack.vim: a search tool
" using 'apt-get install silversearcher-ag' to install ag or 'apt-get install ack-grep' to install ack
Plugin 'mileszs/ack.vim'
nnoremap <F4> viw"zy:Ack! '\b<C-r>z\b' ./ --ignore "*.txt"
vnoremap <F4> "zy:Ack! '<C-r>z' ./ --ignore "*.txt"
cnoremap <F4> Ack! -i '' ./<LEFT><LEFT><LEFT><LEFT>
if executable('ag')
    let g:ackprg = 'ag -a -s --nopager --nocolor --nogroup --column'
endif
" mileszs/ack.vim END

"junegunn/goyo.vim BEGIN
" goyo: Distraction-free writing in Vim 
" Usage - :Goyo [to Toggle Goyo]
Plugin 'junegunn/goyo.vim'
let g:goyo_width=100
let g:goyo_margin_top = 0
let g:goyo_margin_bottom = 0
" junegunn/goyo.vim END

" amix/vim-zenroom2 BEGIN
" vim-zenroom2: A Vim extension that emulates iA Writer environment when editing Markdown, reStructuredText or text files 
Plugin 'amix/vim-zenroom2'
" amix/vim-zenroom2 END

" scrooloose/nerdtree BEGIN
" nerdtree: A tree explorer plugin for vim
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['.*\.pyc$','.*\.o$','.*\.ko$','.*\.so','.*\.a','.*\.swp','.*\.tar','.*\.tar\..*','.*\.zip']  
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=35
" 列出当前目录文件
nnoremap <silent> <F3> :NERDTreeToggle<CR>
" scrooloose/nerdtree END

" ycm-core/YouCompleteMe BEGIN
Plugin 'ycm-core/YouCompleteMe'
set completeopt=menu      " 补全时不打开scratch窗口
" set completeopt-=preview    " 补全内容不以分割子窗口形式出现，只显示补全列表
" let g:ycm_global_ycm_extra_conf='~/.vim/config/ycm_extra_conf/default/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1       " 开启实时错误或者warning的检测
let g:ycm_confirm_extra_conf = 0
let g:ycm_open_loclist_on_ycm_diags = 0     " 不自动打开location list
let g:ycm_collect_identifiers_from_tags_files = 1 
let g:ycm_complete_in_comments = 1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
" let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'

" let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_key_invoke_completion = ''

nnoremap <Leader>yd :YcmDiags<CR>
nnoremap <Leader>yg :YcmCompleter GoTo<CR>
nnoremap <Leader>yi :YcmCompleter GoToInclude<CR>
nnoremap <Leader>yt :YcmCompleter GetType<CR>
nnoremap <Leader>yf :YcmCompleter FixIt<CR>
nnoremap <Leader>yd :YcmCompleter GoToDeclaration<CR>
hi link YcmWarningSection Todo
" ycm-core/YouCompleteMe END

" dense-analysis/ale BEGIN
" ale: Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
Plugin 'dense-analysis/ale'
" let g:ale_set_highlights = 0    " Disabling highlighting
let g:ale_lint_on_text_changed = 'never' " Only run linting when saving the file
" let g:ale_lint_on_enter = 0    " don't let linters to run on opening a file
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
" dense-analysis/ale END

" tpope/vim-fugitive BEGIN
Plugin 'tpope/vim-fugitive'                 
" tpope/vim-fugitive END

" Yggdroot/indentLine BEGIN
Plugin 'Yggdroot/indentLine'
let g:indentLine_char='┊'                 " this feature only works with files whose encoding is UTF-8
" Yggdroot/indentLine END

" EasyMotion BEGIN
Plugin 'EasyMotion'
let g:EasyMotion_leader_key='<Space>'
hi EasyMotionTarget ctermbg=none ctermfg=blue
" EasyMotion END

" kien/ctrlp.vim BEGIN
" 使用<C-p>调用CtrlP, 帮助条目:ctrlp-commands, ctrlp-extensions, ctrlp-mappings, ctrlp-options
Plugin 'kien/ctrlp.vim'
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
" Plugin 'junegunn/fzf'
" junegunn/fzf END

" majutsushi/tagbar BEGIN
Plugin 'majutsushi/tagbar'
let g:tagbar_width=35
let g:tagbar_autofocus=0
let g:tagbar_left = 1
nmap <F6> :TagbarToggle<CR>
" majutsushi/tagbar END

" scrooloose/nerdcommenter BEGIN
" Vim plugin for intensely orgasmic commenting
" usage:[count]<leader>c<space> |NERDComToggleComment|
Plugin 'scrooloose/nerdcommenter'
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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline_theme='molokai'                           " 配置主题：https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline#extensions#tabline#enabled = 1            " Smarter tab line
let g:airline#extensions#tabline#buffer_nr_show = 1     " 显示buffer的序号
" let g:airline_powerline_fonts = 1                       " 以下配置分隔符，需要安装powerline字体
" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif
"
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'
" vim-airline END

" vim-markdown BEGIN
" Syntax highlighting, matching rules and mappings for the original Markdown and extensions
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_conceal = 0
" vim-markdown END

" vim-instant-markdown BEGIN
" Instant Markdown previews from vim
" use command :InstantMarkdownPreview to show the preview
Plugin 'instant-markdown/vim-instant-markdown'
let g:instant_markdown_autostart = 0
" nnoremap <Leader>mc O<div align="center"><ESC>jo</div><ESC>
" vim-instant-markdown END

" cfg.vim BEGIN
" Plugin 'wax5798/cfg.vim'
function Cfg_related_reload()
    if exists("g:cfg_loaded")
        nnoremap <F5> :call Tags_generate(g:cfg_dir)<CR>
        let &tags = &tags . "," . g:cfg_dir . "/tags"

        if filereadable(g:cfg_dir . '/config.vim')
            exe 'source' .  g:cfg_dir . '/config.vim'
        endif

        if filereadable(g:cfg_dir . '/.ycm_extra_conf.py')
            let g:ycm_global_ycm_extra_conf=g:cfg_dir . '/.ycm_extra_conf.py'
        endif

" config ag .agignore file
        if executable('ag')
            let g:ackprg = 'ag -a -s --nopager --nocolor --nogroup --column -p ' . g:cfg_dir . '/.agignore'
        endif
    endif
endfunction
" cfg.vim END

" markdown-preview.vim BEGIN
" MarkdownPreview
" Plugin 'iamcco/markdown-preview.vim'
" let g:mkdp_path_to_chrome = 'firefox'
" let g:mkdp_auto_start = 0
" let g:mkdp_auto_open = 0
" let g:mkdp_auto_close = 1
" let g:mkdp_refresh_slow = 0
" let g:mkdp_command_for_global = 0
" markdown-preview.vim END


" markdown-preview.nvim BEGIN
Plugin 'iamcco/markdown-preview.nvim'
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'firefox'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
" markdown-preview.nvim END

" Shougo/neocomplete.vim BEGIN
" Plugin 'wax5798/neocomplete.vim'
" source ~/.vim_runtime/vimrcs/plugins_config_neocomplete.vim
" Shougo/neocomplete.vim END

" ervandew/supertab BEGIN
" Plugin 'wax5798/supertab'
" let g:SuperTabDefaultCompletionType = "<c-n>"
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
