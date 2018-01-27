" #############################################################################
" tips
" 1、需要关闭alt的菜单功能和HUB功能
" #############################################################################
"##############################################################################
"
"一些基础设置
"
"##############################################################################

set nocompatible            " 去掉有关vi一致性模式
filetype plugin on          " 载入文件类型插件

"++++++++++++++++++++++++++++++鼠标与光标+++++++++++++++++++++++++++++++++++++
set mouse=a                 " 可以使用鼠标
set mousemodel=popup        " 右键单击窗口时弹出快捷菜单???好像没什么用
set cursorline              " 高亮光标所在行
"set cursorcolumn            " 高亮光标所在列

"++++++++++++++++++++++++++++++空白与缩进+++++++++++++++++++++++++++++++++++++
set sw=4	 	    		" 缩进代码时，缩进量为4
set ts=4         	    	" 一个制表符的长度为4
set et						" 编辑时，把所有tab替换为空格???如果有些语言要求必须是空格呢
set smarttab                " 在行首输入tab时插入宽度为sw的空白，在其他地方按ts处理
set smartindent             " 开启新行时使用智能自动缩进
set softtabstop=4           " 统一缩进为4
set cinoptions=g0           " C++ public不缩进
set backspace=2             " 使回格键（backspace）正常处理indent, eol, start等          
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"++++++++++++++++++++++++++++++搜索设置+++++++++++++++++++++++++++++++++++++++
set ignorecase smartcase	" 搜索时智能忽略大小写
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本

"++++++++++++++++++++++++++++++语法折叠+++++++++++++++++++++++++++++++++++++++
set foldenable              " 开启折叠
" set foldmethod=indent       " 设置缩进折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
set foldlevel=100           " 设置折叠层数为
"set foldclose=all           " 设置为自动关闭折叠
" 用tab键来开关折叠
" nnoremap <tab> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"++++++++++++++++++++++++++++++配色与主题+++++++++++++++++++++++++++++++++++++
syntax on
" TODO 有时间找一个好看的主题
" colorscheme desert
" colorscheme morning
colorscheme molokai
let g:rehash256 = 1
" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0

"++++++++++++++++++++++++++++++命令行与状态行+++++++++++++++++++++++++++++++++
set wildmode=longest,list	" 在命令行模式下tab采用shell的补全方式
set showcmd                 " 输入的命令显示出来，看的清楚些
set laststatus=2            " 启动显示状态行(1),总是显示状态行(2)
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  

"++++++++++++++++++++++++++++++解决乱码问题++++++++++++++++++++++++++++++++++
set encoding=utf-8          
set termencoding=utf-8                                                    
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936    

"++++++++++++++++++++++++++++++文件类型++++++++++++++++++++++++++++++++++++++
filetype on                 " 侦测文件类型 
filetype indent on          " 为特定文件类型载入相关缩进文件

au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
" au FileType python set noet
" au FileType python set nosmarttab
au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "取消自动注释,这条配置需要放在filetype plugin on 之后，否则无效???

"++++++++++++++++++++++++++++++其他+++++++++++++++++++++++++++++++++++++++++++
set number                  " 显示行号
"set scrolloff=3             " 光标移动到buffer的顶部和底部时保持3行距离
set scroll=12               " 可以使用ctrl-d, ctrl-u来让屏幕上下滚动scroll指定行数
set textwidth=0             " 禁止自动换行
set hidden                  " 允许在有未保存的修改时切换缓冲区
set report=0                " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set history=1000            " 历史记录数
"set iskeyword+=.,_,$,@,%,#,-  " 带有如下符号的单词不要被换行分割
set viminfo+=!              " 保存全局变量
set selection=inclusive     " 选择包含最后一个字符
"set clipboard+=unnamed      " 共享剪贴板  
set confirm                 " 在处理未保存或只读文件的时候，弹出确认
set autoread                " 文件在Vim之外修改过,自动重新读入
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif
set tags=tags,/usr/include/tags,~/.vim/linux-2.6.36.x/tags

au FileType python set tags=tags
au FileType python let g:ycm_collect_identifiers_from_tags_files = 1 

" Tlist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" au FileType {c,cpp,h} setlocal tags=tags,/usr/include/tags,~/.vim/linux-2.6.36.x/tags
" au FileType {c,cpp,h} let g:ycm_collect_identifiers_from_tags_files = 0

au BufEnter set filetype=ss

" 使用quickfix显示cscope的结果
set cscopequickfix=s-,c-,d-,i-,t-,e-
cs add ./cscope.out ./

"##############################################################################
"
"新建文件标题
"
"##############################################################################

"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*.md exec ":call SetTitle()" 
func SetTitle() 
	" if &filetype == 'sh' " 不能使用filetype的方式做判断，因为这时filetype还没有初始化
	if expand("%:e") == 'sh'
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif expand("%:e") == 'py'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 
	    call append(line(".")+2, "\042\042\042") 
	    call append(line(".")+3, "\042") 
	    call append(line(".")+4, "\042 File: ".expand("%:t")) 
	    call append(line(".")+5, "\042 Author: Wan Xiangjun") 
	    call append(line(".")+6, "\042 Company: TP-Link Co.Ltd") 
	    call append(line(".")+7, "\042 Created: ".strftime("%Y-%m-%d")) 
	    call append(line(".")+8, "\042") 
	    call append(line(".")+9, "\042\042\042") 
    elseif expand("%:e") == 'rb'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")
    elseif expand("%:e") == 'md'
        " call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    elseif expand("%:e") == 'java'
        call setline(1,"public class ".expand("%:r"))
		call append(line("."),"")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%:t")) 
		call append(line(".")+1, "	> Author: Wan Xiangjun") 
		call append(line(".")+2, "	> Mail: ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "")
        call append(line(".")+8, "using namespace std;")
		call append(line(".")+9, "")
	endif
	if expand("%:e") == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "#include <stdlib.h>")
		call append(line(".")+8, "#include <stdint.h>")
		call append(line(".")+9, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:t:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:t:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
endfunc 
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G


"############################################################################## 
"
"键盘命令
"
"##############################################################################
let mapleader=","
let maplocalleader="`"
noremap \ ,

vmap <C-c> "+y

inoremap <C-g> <Esc>gUawea
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I
inoremap <C-]>  {<CR>}<ESC>ko

" cnoremap <expr> %% getcmdtype()==':' ? expand('%:h').'/' : '%%' // TODO 什么用

" 查找C代码符号
nnoremap <Leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
" 查找本定义
nnoremap <Leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
" 查找调用本函数的函数
nnoremap <Leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
" 查找本字符串
nnoremap <Leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
" 查找本egrep模式
nnoremap <Leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
" 查找本文件
nnoremap <Leader>cf :cs find f <C-R>=expand("<cword>")<CR><CR>
" 查找包含本文件的文件
nnoremap <Leader>ci :cs find i ^<C-R>=expand("<cword>")<CR><CR>
" 查找本函数调用的函数
nnoremap <Leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>

" 给函数添加说明
nnoremap <Leader>m "xyiwO/**<CR>*function:<Tab><C-r>x<CR>*author:<Tab><Tab>WXJ<wanxiangjun@tp-link.com.cn><CR>*description:<CR>*return:<CR>**/<Esc>kk$

nnoremap <Leader>cn oif (NULL == ) {<CR>}<Esc>kf)i

" 和speeddating冲突
" nnoremap <C-a> :wa<CR>
nnoremap s :wa<CR>
" nnoremap <F2> :vert diffsplit  " TODO 什么用？

" gd 在函数内部跳转（局部变量）
nnoremap <C-]> g<C-]>
nnoremap <C-LeftMouse> <LeftMouse>g<C-]>
" nnoremap <C-RightMouse> <C-o>
nnoremap <C-RightMouse> <LeftMouse><C-t>
nnoremap <C-n> zzLzz
nnoremap <C-u> zzHzz
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" 用于切换buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" 用于quickfix条目的切换
nnoremap <silent> [c :cprevious<CR>
nnoremap <silent> ]c :cnext<CR>
nnoremap <silent> [C :cfirst<CR>
nnoremap <silent> ]C :clast<CR>

" 用于location list条目的切换
" 可以使用:lopen 和 :lclose 打开或关闭location list
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
nnoremap <C-j> gjzz
nnoremap <C-k> gkzz

" nnoremap <C-m> oint main(int argc, char *argv[])<CR>{<CR>return 0;<CR>}<ESC>kO

"nmap wm :WMToggle<cr>

nnoremap <F4> :Rgrep<CR><CR><CR>.[ch]*<CR><CR>
nnoremap <F5> :!ctags -R<CR><CR>:!cscope -Rbq<CR><CR>:cs add ./cscope.out ./<CR>
" nnoremap <F5> :!ctags -R --c-kinds=+px-d<CR><CR>:!cscope -Rbq<CR><CR>:cs add ./cscope.out ./<CR>

" C，C++ 按F8编译运行
nnoremap <F8> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		" exec "!gcc % -o %<"
		" exec "!time ./%<"
		exec "!gcc % -g"
		exec "!time ./a.out"
	elseif &filetype == 'cpp'
		" exec "!g++ % -o %< -std=c++11"
		" exec "!time ./%<"
		exec "!g++ % -std=c++11 -g"
		exec "!time ./a.out"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'markdown'
        exec 'MarkdownPreview'
	endif
endfunc

nnoremap <Leader>f :call FormartSrc()<CR>
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc


" C,C++的调试
nnoremap <F9> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc

"##############################################################################
"
"插件
"
"##############################################################################
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" Valloric/YouCompleteMe BEGIN
Plugin 'Valloric/YouCompleteMe'
set completeopt=menu    " 补全时不打开scratch窗口
let g:ycm_global_ycm_extra_conf='~/.vim/config/ycm_extra_conf/default/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_open_loclist_on_ycm_diags = 0     " 不自动打开location list
let g:ycm_collect_identifiers_from_tags_files = 0 " 不使用tags补全
let g:ycm_complete_in_comments = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/config/ycm_extra_conf/default/.ycm_extra_conf.py'
" let g:ycm_key_invoke_completion = '<C-Space>'
" let g:ycm_key_invoke_completion = ''
nnoremap <Leader>yd :YcmDiags<CR>
nnoremap <Leader>yg :YcmCompleter GoTo<CR>
nnoremap <Leader>yi :YcmCompleter GoToInclude<CR>
nnoremap <Leader>yt :YcmCompleter GetType<CR>
nnoremap <Leader>yf :YcmCompleter FixIt<CR>
" nnoremap <Leader>yd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>yd :YcmCompleter GoToDeclaration<CR>
hi link YcmWarningSection Todo
" Valloric/YouCompleteMe END

" tpope/vim-fugitive BEGIN
" TODO 学习完git之后再来看这个插件的用途
Plugin 'tpope/vim-fugitive'                 
set statusline+=%{fugitive#statusline()}    " show Git hotness
" tpope/vim-fugitive END

" Yggdroot/indentLine BEGIN
Plugin 'Yggdroot/indentLine'
set t_Co=256
let g:indentLine_char='┊'                 " this feature only works with files whose encoding is UTF-8
" Yggdroot/indentLine END

" L9 BEGIN
" TODO 这个库有什么用途
Plugin 'L9'          
" L9 END

" Auto-Pairs BEGIN
" 和.操作有冲突，暂时屏蔽
" Plugin 'Auto-Pairs'
" Auto-Pairs END

" EasyMotion BEGIN
" 使用空格 + {w,f,F,b,e ...}
Plugin 'EasyMotion'
let g:EasyMotion_leader_key='<Space>'
" EasyMotion END

" FuzzyFinder BEGIN
" TODO 文件查找, 功能很强大，具体有待研究???太久没人维护了，是否有其它替代插件
"Plugin 'FuzzyFinder'
" FuzzyFinder END

" python-imports.vim BEGIN
" TODO 暂时不用python
" Plugin 'python-imports.vim'
" python-imports.vim END

" kien/ctrlp.vim BEGIN
" 使用<C-p>调用CtrlP, 帮助条目:ctrlp-commands, ctrlp-extensions, ctrlp-mappings, ctrlp-options
" Once CtrlP is open:
"    Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"    Press <c-f> and <c-b> to cycle between modes.
"    Press <c-d> to switch to filename only search instead of full path.
"    Press <c-r> to switch to regexp mode.
"    Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"    Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"    Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"    Use <c-y> to create a new file and its parent directories.
"    Use <c-z> to mark/unmark multiple files and <c-o> to open them.
Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_by_filename = 1
set wildignore+=*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif,*.o,*.ko,*.a,*.exe,*.dll,*.git,*.svn
nmap <Leader>pb :CtrlPBuffer<CR>
nmap <Leader>pp :CtrlP<CR>
nmap <Leader>pm :CtrlPMRU<CR>
" kien/ctrlp.vim END

" majutsushi/tagbar BEGIN
" TODO conflict with nerdtree and winmanager ??
Plugin 'majutsushi/tagbar'
let g:tagbar_width=35
let g:tagbar_autofocus=0
nmap <F6> :TagbarToggle<CR>
" majutsushi/tagbar END

" taglist.vim BEGIN
" 使用:Tlist打开
" Plugin 'taglist.vim'
" let Tlist_Show_One_File=1
" let Tlist_Exit_OnlyWindow=1
" taglist.vim END

" scrooloose/syntastic BEGIN
" TODO 有时间可以看一下
" Plugin 'scrooloose/syntastic'
" let g:syntastic_python_checkers=['pylint']
" let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
" scrooloose/syntastic END

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

" netrw.vim: 为自带插件
" - 返回上级目录; c 切换vim 当前工作目录正在浏览的目录
" d 创建目录; D 删除目录或文件
" i 切换显示方式; R 文件或目录重命名
" s 选择排序方式; x 定制浏览方式, 使用你指定的程序打开该文件

" scrooloose/nerdtree BEGIN
" TODO 因为直接从github上装的和tagbar冲突，所以直接用的NERD_tree.vim
" nerdtree: A tree explorer plugin for vim???conflict with tagbar and winmanager
" Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['.*\.pyc$','.*\.o$','.*\.ko$']  " 忽略.pyc .o .ko 结尾的文件
" 列出当前目录文件
nnoremap <silent> <F3> :NERDTreeToggle<CR>
" autocmd vimenter * if !argc() | NERDTree | endif    "当打开vim且没有文件时自动打开NERDTree
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" scrooloose/nerdtree END

" orgmode BEGIN
Plugin 'vim-orgmode'

" 以下是依赖插件
Plugin 'utl.vim'            " Univeral Text Linking
Plugin 'speeddating.vim'
Plugin 'calendar.vim'
Plugin 'SyntaxRange'

"orgmode END

" vim-markdown BEGIN
" Syntax highlighting, matching rules and mappings for the original Markdown and extensions
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
" vim-markdown END

" vim-instant-markdown BEGIN
" Instant Markdown previews from vim
Plugin 'suan/vim-instant-markdown'
let g:instant_markdown_autostart = 1
" vim-instant-markdown END

" markdown-preview.vim BEGIN
" MarkdownPreview
Plugin 'iamcco/markdown-preview.vim'
let g:mkdp_path_to_chrome = "firefox"
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
" markdown-preview.vim END


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


" TODO
" doc 目录下的帮助文件似乎没有效
" vimdiff, svndiff
" nerdcommenter怎么控制注释方式，如整块注释和单行注释

" #############################################################################
"
" Tips
"
" #############################################################################

" 在命令行中，符号%代表当前文件名，如:!wc %
" :shell 命令启动一个交互的shell会话，使用exit退出此会话
" :read !{cmd} 命令，把{cmd}命令的输出（包括stderr）读入到当前缓冲区中
" :write !{cmd} 命令把缓冲区的内容作为指定{cmd}的标准输入，如 :write !sh
" :w !sudo tee % > /dev/null 命令以超级用户权限保存文件
" :bd 命令用来关闭当前buffer而不需要推出当前vim
" !{motion}操作符切换到命令行模式，并把指定{motion}所涵盖的范围预置在命令行上，如 !G

