#!/bin/bash

for element in `ls ~/.vim_cache`
do
    action="del"
    for file in `ls -a ~/.vim_cache/${element}`
    do
        if [ ${file} = "." ]; then
            continue
        fi

        if [ ${file} = ".." ]; then
            continue
        fi

        if [ ${file} = "tags" ]; then
            continue
        fi

        if [ ${file} = "cwd" ]; then
            continue
        fi

        action="notDel"
        break
    done

    if [ ${action} = "del" ]; then
        rm ~/.vim_cache/${element} -rf
    fi
done


