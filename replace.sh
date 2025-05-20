#!/bin/zsh

# 定义目标目录
TARGET_DIR="./gewu-nlp"

# 使用find递归查找所有文件，并逐个处理
find "$TARGET_DIR" -type f -exec sh -c '
    # 实时打印正在处理的文件路径
    echo "Processing: $1"
    
    # 使用perl进行不区分大小写的全局替换（无需备份）
    perl -pi -e "s/stanford/gewu/gi" "$1"
' _ {} \;

echo "替换完成！"
