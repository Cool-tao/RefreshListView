#!/usr/bin/env bash
echo "********** 第1步 **********"

#切换分支名称
readonly SWITCH_BRANCH=$1
#分支名称
readonly CREATE_TAG_NAME=$2
#创建的分支简介
readonly CREATE_TAG_MESSAGE=$3

echo "********** 切换分支 **********"
git checkout ${SWITCH_BRANCH}

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