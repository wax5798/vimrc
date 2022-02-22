##!/bin/bash

TARGET="./.ycm_extra_conf.py"
YCMPY1="/home/osrc/.vim_runtime/example/config/ycm_extra_conf.beg"
YCMPY2="/home/osrc/.vim_runtime/example/config/ycm_extra_conf.end"
TMP=.tmp

PWD=$(pwd)
PRJ=$(basename ${PWD})

filelist=$(find $PWD | grep -E "^.*\.h$")

for file in ${filelist}
do
    echo $(dirname "${file}") >> ${TMP}
done

cat ${YCMPY1} > ${TARGET}
DIR=$(cat ${TMP} | sort -u)
for i in ${DIR}
do
    echo "'-I'," >> ${TARGET}
    echo "'${i}'," >> ${TARGET}
done
cat ${YCMPY2} >> ${TARGET}

rm -rf ${TMP}
