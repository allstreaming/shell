#!/bin/bash

now_ts=$(date +%s)
boot_ts=$(date -d "$(uptime -s)" +%s)

diff_sec=$((now_ts - boot_ts))

days=$((diff_sec / 86400))
hours=$(((diff_sec % 86400) / 3600))
mins=$(((diff_sec % 3600) / 60))


ip_addr=$(hostname -I | awk '{for(i=1;i<NF;i++) if ($i !~ /^127\./) print $i}' | tr '\n' ' ' | sed 's/ $//')

cpu_model=$(lscpu | grep "Model name" | head -n1 | awk -F: '{print $2}' | xargs)
cpu_sockets=$(lscpu | grep "Socket(s)" | awk '{print $2}')


mem_total=$(free -h --si | awk '/Mem:/ {print $2}')


gpu_info=$(nvidia-smi --query-gpu=name --format=csv,noheader \
 | tr -d '\r' \
 | sort | uniq -c \
 | awk '{print $2" "$3" "$4"x"$1}')


disk_info=$(lsblk -d -o SIZE,MODEL,TYPE \
 | grep "disk" \
 | grep -v "MODEL" \
 | awk '{print $1}' \
 | sort | uniq -c \
 | awk '{print $1"x"$2}' \
 | tr '\n' '+' \
 | sed 's/ + $//')

ib_count=$(lspci |grep -i 'Infiniband' | wc -l)


nic_count=$(lspci |grep -i eth | wc -l)

echo "当前时间: $(date +'%Y-%m-%d %H:%M:%S')"
echo -e "IP: ${ip_addr}\nCPU: ${cpu_model}x${cpu_sockets} \nRAM: ${mem_total} \nGPU: ${gpu_info} \nDisk: ${disk_info} \nIB: ${ib_count} \nNIC: ${nic_count}"

# 系统开关机时间
echo "开机时间: $(uptime -s)"
echo "系统运行时间: ${days} 天 ${hours} 小时 ${mins} 分钟"

