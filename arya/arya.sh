#!/bin/bash

hooks_path=$(git config -l | grep 'core.hookspath=')

if [[ $hooks_path == *"arya/.husky"* ]]; then
    printf "\e[32m%s\e[0m\n" "✅ arya依赖已安装"
    exit 0
fi

command -v npm > /dev/null 2>&1

if [ ! $? -eq 0 ]; then
    printf "\e[31m%s\e[0m\n" "❌ 未找到npm命令！"
    printf "🔧开始安装 npm"
    curl -qL https://www.npmjs.com/install.sh | sh
    if [ ! $? -eq 0 ]; then
        printf "\e[31m%s\e[0m\n" "❌ npm安装失败，请手动安装！"
        exit 1
    fi
fi

printf "🔧开始初始化 arya"
cd arya && npm install && cd ..
if [ ! $? -eq 0 ]; then
    printf "\e[31m%s\e[0m\n" "❌ arya初始化失败！请重试或反馈给 Henrik"
fi

command -v git > /dev/null 2>&1

if [ ! $? -eq 0 ]; then
    printf "\e[31m%s\e[0m\n" "❌ 未找到git命令，请安装git！"
    exit 1
fi

git_version=$(git --version | awk '{print $3}')

if [ "$(printf "$git_version\n2.9" | sort -V | tail -n 1)" == "2.9" ]; then
    printf "\e[31m%s\e[0m\n" "❌ 当前git版本为%s，请更新到2.9以后版本" "$git_version"
    exit 1
fi



