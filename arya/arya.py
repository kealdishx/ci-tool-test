#!/usr/bin/env python3
import os
import shutil
import subprocess
import sys

if os.path.exists("./泰国旅行材料"):



def install_dependencies():
    check_git()
    check_npm()


def check_git():
    git_path = shutil.which('git')

    if git_path is None:
        print("\033[91mgit命令不存在，请安装git环境！！！\033[0m")
        sys.exit(-1)

def check_npm():
    npm_path = shutil.which('npm')

    if npm_path is None:
        print("\033[91m开始安装npm\033[0m")
        result = subprocess.run("ls -l", shell=True, 
                                stdout=subprocess.PIPE, 
                                stderr=subprocess.PIPE, 
                                text=True)
        print(result.stdout)
        if result.returncode != 0:
            print("\033[91m安装npm失败！！！\033[0m")
            sys.exit(-1)

