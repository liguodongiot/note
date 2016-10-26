#!/bin/bash

# ----------------------------------------------------------------------
# name:         move_file_1.1.sh
# version:      1.1
# createTime:   2016-10-26
# description:  移动压缩文件、解压缩、重命名
# author:       liguodong
# email:        liguodongiot@gmail.com
# github:       https://github.com/liguodongIOT
# ----------------------------------------------------------------------

echo "开始执行脚本..."

if [ ! $# == 2 ]; then

echo "Usage: $0 targetFileName renameFileName"
echo "如果无需重命名，请将参数2传递为空字符串... "
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

file=$1

if [ "${file##*.}"x = "gz"x ]||[ "${file##*.}"x = "tgz"x ]
then
	echo "正在解压缩指定文件${file}..."
	tar -zxvf ${file}
elif [ "${file##*.}"x = "zip"x ]
then
	echo "正在解压缩指定文件${file}..."
	unzip ${file}
else
	echo "${file}不符合格式要求，即将退出。。。"
	exit 1
fi


echo "正在删除压缩文件..."
rm ${1}


if [ "${2}" = "" ]
then
	echo "参数2为空字符串，无需重命名。。。"
else
	echo "正在重命名解压缩文件..."
	temp="*"${2}"*"
	mv ${temp} ${2}
fi


echo "执行脚本结束..."

