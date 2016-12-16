"##############################################################################
"
"一些基础设置
"
"##############################################################################

set nocompatible            " 去掉讨厌的有关vi一致性模式
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
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
set foldlevel=100           " 设置折叠层数为
"set foldclose=all           " 设置为自动关闭折叠
" 用tab键来开关折叠
" nnoremap <tab> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"++++++++++++++++++++++++++++++配色与主题+++++++++++++++++++++++++++++++++++++
syntax on
colorscheme desert
"colorscheme molokai
"highlight NonText guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0

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

au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
au FileType python set noet
au FileType python set nosmarttab
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
set scroll=20               " 可以使用ctrl-d, ctrl-u来让屏幕上下滚动scroll指定行数
set textwidth=0             " 禁止自动换行
set hidden                  " 允许在有未保存的修改时切换缓冲区
set report=0                " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set history=1000            " 历史记录数
set iskeyword+=.,_,$,@,%,#,-  " 带有如下符号的单词不要被换行分割
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
"set tags=./tags,tags,../tags
set tags=tags

" 使用quickfix显示cscope的结果
set cscopequickfix=s-,c-,d-,i-,t-,e-
cs add ./cscope.out ./

"##############################################################################
"
"新建文件标题
"
"##############################################################################

"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
func SetTitle() 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: wan xiangjun") 
		call append(line(".")+2, "	> Mail: ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
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
noremap \ ,

" shift tab pages
"map <S-Left> :tabp<CR>
"map <S-Right> :tabn<CR>
map! <C-Z> <Esc>zzi
map <C-A> <Esc>ggVG$
" 选中状态下 Ctrl+c 复制
"map <C-v> "+p
map! <C-v> <C-r>+
vmap <C-c> "+y
"比较文件  
nnoremap <F2> :vert diffsplit

" 查找C代码符号
nmap <Leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" 查找本定义
nmap <Leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" 查找调用本函数的函数
nmap <Leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" 查找本字符串
nmap <Leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" 查找本egrep模式
nmap <Leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" 查找本文件
nmap <Leader>f :cs find f <C-R>=expand("<cword>")<CR><CR>
" 查找包含本文件的文件
nmap <Leader>i :cs find i ^<C-R>=expand("<cword>")<CR><CR>
" 查找本函数调用的函数
nmap <Leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-]> g<C-]>
nnoremap <C-n> <C-d>
nnoremap <C-LeftMouse> g<C-]>
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

cnoremap <expr> %% getcmdtype()==':' ? expand('%:h').'/' : '%%'
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
noremap <Leader>n nzz
noremap <Leader>N Nzz

noremap <Leader>p :set paste!<CR>


"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>

nnoremap <F5> :!ctags -R<CR><CR>
" C，C++ 按F8编译运行
map <F8> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
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
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc

" C,C++的调试
map <F9> :call Rungdb()<CR>
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

" 非常强大的自动补全工具
Plugin 'Valloric/YouCompleteMe'

" vim-fugitive: Git wrapper 常用命令:Gdiff, help fugitive.txt获取帮助
Plugin 'tpope/vim-fugitive'                 
set statusline+=%{fugitive#statusline()}    " show Git hotness

" indentLine: 缩进对齐线
Plugin 'Yggdroot/indentLine'
set t_Co=256
let g:indentLine_char='┊'                 " this feature only works with files whose encoding is UTF-8
"let g:indentLine_color_term=108           " change charactor color

" L9: vim-scripts repos
Plugin 'L9'                                 " usage: see source code???还是不知道干什么用的。。。

" Auto-Pairs: 插入或删除括号和双引号时自动配对
" Plugin 'Auto-Pairs'

" EasyMotion: 一个快速跳转工具
" 使用空格 + {w,f,F,b,e}
Plugin 'EasyMotion'
let g:EasyMotion_leader_key='<Space>'

" vim-scripts/a.vim: :A切换到相应的C文件或H文件，:AV, :AS分割窗口并打开文件
Plugin 'vim-scripts/a.vim'

" vim-scripts/grep.vim: Grep search tools integration with Vim
Plugin 'vim-scripts/grep.vim'
" 常用命令:Grep, GrepArgs
nnoremap <silent> <F3> :Rgrep<CR>

" FuzzyFinder: 文件查找, 功能很强大，具体有待研究???太久没人维护了，是否有其它替代插件
"Plugin 'FuzzyFinder'

" python-imports: This VIM plugin automates the insertion of import statements at the top of a file.
Plugin 'python-imports.vim'

" kien/ctrlp.vim: Fuzzy file, buffer, mru, tag, etc finder.
" 使用<C-p>调用CtrlP, 帮助条目:trlp-commands, trlp-extensions, ctrlp-mappings
" 只能在当前工作目录下查找吗???
Plugin 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif,*.o,*.ko,*.a     " MacOSX/Linux
"wset wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']

" ctrlp-modified.vim: Easily open locally modified files in your git-versioned projects 
Plugin 'ctrlp-modified.vim'
" shows all files which have been modified since your last commit
map <Leader>m :CtrlPModified<CR>
" shows all files modified on your current branch
map <Leader>M :CtrlPBranch<CR>

" displays tags in a window, ordered by scope???conflict with nerdtree and winmanager
"Plugin 'majutsushi/tagbar'
"let g:tagbar_width=35
"let g:tagbar_autofocus=1
"nmap <F6> :TagbarToggle<CR>

" taglist.vim: 使用:Tlist打开
Plugin 'taglist.vim'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers=['pylint']
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']

" scrooloose/nerdcommenter: Vim plugin for intensely orgasmic commenting
"Plugin 'scrooloose/nerdcommenter'

" vim-airline/vim-airline: lean & mean status/tabline for vim that's light as air
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

" netrw.vim: 为自带插件
" - 返回上级目录; c 切换vim 当前工作目录正在浏览的目录
" d 创建目录; D 删除目录或文件
" i 切换显示方式; R 文件或目录重命名
" s 选择排序方式; x 定制浏览方式, 使用你指定的程序打开该文件

" Winmanager: 窗口管理工具
Plugin 'Winmanager'
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

"Plugin 'The-NERD-Commenter'

" nerdtree: A tree explorer plugin for vim???conflict with tagbar and winmanager
"Plugin 'scrooloose/nerdtree'
"let NERDTreeIgnore=['.*\.pyc$','.*\.o$','.*\.ko$']  " 忽略.pyc .o .ko 结尾的文件
" 列出当前目录文件
"map <F4> :NERDTreeToggle<CR>            
"autocmd vimenter * if !argc() | NERDTree | endif    "当打开vim且没有文件时自动打开NERDTree
" 只剩 NERDTree时自动关闭
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


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


" 常用的帮助命令: g; 
" vimdiff, svndiff
