#!/bin/bash

# ----------------------------------------------------------------------
# name:         move_file.sh
# version:      1.0
# createTime:   2016-10-19
# description:  移动压缩文件、解压缩、重命名
# author:       liguodong
# email:        liguodongiot@gmail.com
# github:       https://github.com/liguodongIOT
# ----------------------------------------------------------------------

echo "开始执行脚本..."

if [ ! $# == 2 ]; then

echo "Usage: $0 targetFileName renameFileName"
exit

fi 

echo "当前路径为:"

path=`pwd`

echo "${path}"

echo "进入指定目录:"
target=/home/liguodong/Downloads/

cd ${target}

echo "${target}"

#移动指定文件到安装目录
installPath=/home/liguodong/install/

targetFile=${target}${1}
cp ${targetFile} ${installPath}

echo "正在进入安装目录..."
cd ${installPath}

echo "当前路径为:"
path=`pwd`
echo "${path}"

echo "正在解压缩指定文件..."
tar -zxvf ${1}

echo "正在删除压缩文件..."
rm ${1}

echo "正在重命名解压缩文件..."
temp="*"${2}"*"

mv ${temp} ${2}

echo "执行脚本结束..."

