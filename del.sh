#!/usr/bin/env zsh

# 设置目标目录（当前目录下的superset文件夹）
target_dir="./gewu-nlp"

# 使用find命令递归查找所有文件（排除目录本身）
find "$target_dir" -type f | while read -r file; do
    # 打印正在处理的文件路径（使用ANSI转义码实现动态效果）
    printf "\r⏳ Processing: \033[34m%s\033[0m" "$file"
    
    # 执行删除操作（macOS版sed需要空备份扩展名）
    sed -i '' -e '/^#/d' "$file"
    
    # 完成文件处理后换行显示
    echo -e "\n✅ Completed: $file"
done

# 最终完成提示
echo -e "\n\033[32mAll files processed successfully!\033[0m"
