#!/usr/bin/env bash
echo "********** 第1步 **********"

#需要合并的分支
readonly CUR_BRANCH=$1
#DEV分支
readonly BRANCH_DEV=$2
#MASTER分支
readonly BRANCH_MASTER=$3
#分支名称
readonly CREATE_TAG_NAME=$4
#创建的分支简介
readonly CREATE_TAG_MESSAGE=$5

echo "********** 切换到DEV分支并提交 **********"
git checkout dev
git merge ${CUR_BRANCH}
git push origin dev

echo "********** 切换到MASTER分支并提交 **********"
git checkout master
git merge ${CUR_BRANCH}
git push origin master

echo "********** 查看当前所在分支 **********"
git branch -v

echo "********** 显示当前所有tag **********"
git tag -l "master"

echo "********** 创建tag **********"
git tag -a ${CREATE_TAG_NAME} -m ${CREATE_TAG_MESSAGE}

echo "********** 提交tag **********"
git push origin ${CREATE_TAG_NAME}

echo "********** 查看标签信息 **********"
git show ${CREATE_TAG_NAME}