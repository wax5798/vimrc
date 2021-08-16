" This script is used to gather config files


if exists("g:cfg_loaded")
    finish
endif
let g:cfg_loaded = 1

let s:cache_pre = expand("~/.vim_cache/")
let s:cur_dir = getcwd()

function s:path_to_md5(path)
    let s:path_md5 = split(system("echo " . a:path . " | md5sum"))[0]
    return s:path_md5
endfunction

let g:cfg_dir = s:cache_pre . s:path_to_md5(getcwd())

if (isdirectory(g:cfg_dir) == 0) && (getcwd() !~ s:cache_pre . ".*")
    call mkdir(g:cfg_dir, "p")
    call system("echo " . s:cur_dir . " > " . g:cfg_dir . "/cwd")
endif

if exists("*Cfg_related_reload")
    call Cfg_related_reload()
endif

function s:cfg_dir_copy()
    let @+ = g:cfg_dir
endfunction

command! -buffer CfgDirCopy call s:cfg_dir_copy()
