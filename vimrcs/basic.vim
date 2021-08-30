" #############################################################################
" tips
" 1、需要关闭alt的菜单功能和HUB功能
" #############################################################################
"##############################################################################
"
" 一些基础设置
"
"##############################################################################

set nocompatible            " 去掉有关vi一致性模式

"++++++++++++++++++++++++++++++鼠标与光标+++++++++++++++++++++++++++++++++++++
set mouse=a                 " 可以使用鼠标
set cursorline              " 高亮光标所在行

"++++++++++++++++++++++++++++++空白与缩进+++++++++++++++++++++++++++++++++++++
set sw=4	 	    		" 缩进代码时，缩进量为4
set ts=4         	    	" 一个制表符的长度为4
" set et						" 编辑时，把所有tab替换为空格
set smarttab                " 在行首输入tab时插入宽度为sw的空白，在其他地方按ts处理
set smartindent             " 开启新行时使用智能自动缩进
set softtabstop=4           " 统一缩进为4
set cinoptions=g0           " C++ public不缩进
set backspace=2             " 使回格键（backspace）正常处理indent, eol, start等          
let g:html_indent_inctags = "html,body,head,tbody"  " 缩进body head
let g:html_indent_script1 = "inc"   " 缩进<script>标签
let g:html_indent_style1 = "inc"    " 缩进<style>标签

"++++++++++++++++++++++++++++++搜索设置+++++++++++++++++++++++++++++++++++++++
set ignorecase smartcase	" 搜索时智能忽略大小写
set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本

vnoremap * "zy/<C-R>z<CR>
vnoremap # "zy/<C-R>z<CR>

"++++++++++++++++++++++++++++++语法折叠+++++++++++++++++++++++++++++++++++++++
set foldenable              " 开启折叠
" set foldmethod=indent       " 设置缩进折叠
" set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
set foldlevel=100           " 设置折叠层数为
"set foldclose=all           " 设置为自动关闭折叠
" 用tab键来开关折叠，tab 与 <C-I> 绑定
" nnoremap <tab> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"++++++++++++++++++++++++++++++配色与主题+++++++++++++++++++++++++++++++++++++
syntax on

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    " colorscheme desert
    colorscheme elflord
catch
endtry
    
set background=dark

"++++++++++++++++++++++++++++++命令行与状态行+++++++++++++++++++++++++++++++++
set wildmode=longest,list	" 在命令行模式下tab采用shell的补全方式
set showcmd                 " 输入的命令显示出来，看的清楚些
set laststatus=2            " 启动显示状态行(1),总是显示状态行(2)
set wildmenu                " turn on the wild menu
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容

"++++++++++++++++++++++++++++++解决乱码问题++++++++++++++++++++++++++++++++++
set encoding=utf-8          
set termencoding=utf-8                                                    
" set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936

"++++++++++++++++++++++++++++++文件类型++++++++++++++++++++++++++++++++++++++
filetype on                 " 侦测文件类型 
filetype plugin on          " 载入文件类型插件
filetype indent on          " 为特定文件类型载入相关缩进文件

au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript

autocmd BufNewFile * normal G   "新建文件后，自动定位到文件末尾

au FileType python set noet
au FileType python set nosmarttab
au FileType python let g:ycm_collect_identifiers_from_tags_files = 1 

au FileType vue,javascript set expandtab
au FileType vue,javascript set sw=2
au FileType vue,javascript set ts=2

au FileType c set tags+=/usr/include/tags

au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "取消自动注释,这条配置需要放在filetype plugin on 之后，否则无效???

"++++++++++++++++++++++++++++++其他+++++++++++++++++++++++++++++++++++++++++++
let mapleader=","
set number                  " 显示行号
set textwidth=500           " 禁止自动换行
set hidden                  " 允许在有未保存的修改时切换缓冲区
set report=0                " 通过 ":" 命令改变的行数超过 report 的值时，会给出提示
set history=1000            " 历史记录数
"set iskeyword+=.,_,$,@,%,#,-  " 带有这些符号的单词不要被换行分割
set viminfo+=!              " 保存全局变量
set selection=inclusive     " 选择包含最后一个字符
"set clipboard+=unnamed      " 共享剪贴板  
set confirm                 " 在处理未保存或只读文件的时候，弹出确认
set autoread                " 文件在Vim之外修改过,自动重新读入
set lazyredraw              " Don't redraw while executing macros (good performance config)
set wrap                    " 当一行太长时，会根据自动显示换行，换行长度由 textwidth 设置
" 修改查找字符串高亮颜色
hi Search term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow

" When editing a file, always jump to the last cursor position
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif

set wildignore=*.so,*.swp,*.zip,*.tar,*.tar.*,*.pyc,*.png,*.jpg,*.gif,*.o,*.ko,*.a,*.exe,*.dll
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set tags=tags


"##############################################################################
"
" cscope
"
"##############################################################################

" 使用quickfix显示cscope的结果
set cscopequickfix=s-,c-,d-,i-,t-,e-
cs add ./cscope.out ./

"############################################################################## 
"
" 键盘映射
"
"##############################################################################


"++++++++++++++++++++++++++++++ visual mode +++++++++++++++++++++++++++++++++++++
vnoremap <C-c> "+y

"++++++++++++++++++++++++++++++ insert mode +++++++++++++++++++++++++++++++++++++
inoremap <C-g> <Esc>gUawea
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I
inoremap <C-]>  {<CR>}<ESC>ko

" 插入日期
inoremap <C-d> <c-r>=strftime("%Y-%m-%d %a")<CR>


"++++++++++++++++++++++++++++++ command mode +++++++++++++++++++++++++++++++++++++
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" W to sudo & write a file
cnoremap w w !sudo tee % > /dev/null


"++++++++++++++++++++++++++++++ normal mode +++++++++++++++++++++++++++++++++++++
" 给函数添加说明
nnoremap <Leader>m "xyiwO/**<CR>*function:<Tab><C-r>x<CR>*author:<Tab><Tab><wanxiangjun@tp-link.com.cn><CR>*description:<CR>*return:<CR>**/<Esc>kk$

" 保存文件
nnoremap s :wa<CR>

" 0 跳转到第一个非空白字符
nnoremap 0 ^

" * # 高亮但不跳转
nnoremap * mmHmt<C-o>*`tzt`m
nnoremap # mmHmt<C-o>*`tzt`m

" 跳转
nnoremap <C-]> g<C-]>
nnoremap <C-LeftMouse> <LeftMouse>g<C-]>
nnoremap <C-RightMouse> <LeftMouse><C-t>

" 上下翻动半页
nnoremap <C-n> zzLzz
nnoremap <C-u> zzHzz

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

" 上下移动鼠标
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" 在小窗口间移动
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" nnoremap <F5> :!ctags -R<CR><CR>
nnoremap <F5> :call Tags_generate("./")<CR>

" C，C++ 按F8编译运行
nnoremap <F8> :call CompileRunGcc()<CR>

nnoremap <Leader>f :call FormartSrc()<CR>

" C,C++的调试
nnoremap <F9> :call Rungdb()<CR>

" cscope
" 生成并重新加载 cscope.out
nnoremap <Leader>co :!cscope -Rbq<CR><CR>:cs add ./cscope.out ./<CR>
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

"##############################################################################
"
" gvim config
"
"##############################################################################
if has("gui_running")
    " 设置字体
    if has("gui_gtk2")
        :set guifont=Luxi\ Mono\ 10
    elseif has("x11")
        " Also for GTK 1
        :set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
    elseif has("gui_win32")
        :set guifont=Luxi_Mono:h10:cANSI
    endif
    
    " 不显示 toolbar
    set guioptions-=T
    set guioptions-=e
endif


" #############################################################################
"
" functions
"
" #############################################################################

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
        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
        call append(line("."), "<style>")
        call append(line(".")+1, "h1 {")
        call append(line(".")+2, "    text-align: center;")
        call append(line(".")+3, "    border-left: 5px solid #e86422;")
        call append(line(".")+4, "    border-right: 5px solid #e86422;")
        call append(line(".")+5, "}")
        call append(line(".")+6, "h2 {")
        call append(line(".")+7, "    border-left: 5px solid #ff7f00;")
        call append(line(".")+8, "    padding-left: 10px;")
        call append(line(".")+9, "}")
        call append(line(".")+10, "h3 {")
        call append(line(".")+11, "    border-left: 5px solid #e86422;")
        call append(line(".")+12, "    padding-left: 8px;")
        call append(line(".")+13, "}")
        call append(line(".")+14, "h4 {")
        call append(line(".")+15, "    border-left: 3px solid #f0a000;")
        call append(line(".")+16, "    padding-left: 5px;")
        call append(line(".")+17, "}")
        call append(line(".")+18, "</style>")
        call append(line(".")+19, "")
        call append(line(".")+20, "Release log:")
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
		:!time sh %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'markdown'
        exec 'MarkdownPreview'
        " exec 'InstantMarkdownPreview'
	endif
endfunc


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

function Tags_generate(outdir)
    " let l:cmd = 'ctags -R ' . getcwd() . ' -f ' . a:outdir . '/tags'
    if exists("g:tags_dir")
        let l:cmd = 'ctags -f ' . a:outdir . '/tags' . ' -R ' . g:tags_dir
    else
        let l:cmd = 'ctags -f ' . a:outdir . '/tags' . ' -R ' . getcwd()
    endif
    echo "cmd: " . l:cmd
    call system(l:cmd)
    echo "done"
endfunction

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
" 可以通过 %!xxd 和 %!xxd -r 在文本与十六进制之间转换
