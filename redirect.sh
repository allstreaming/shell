#!/bin/bash

# Flushing the exsited settings
echo "Flushing the exsited settings"
sleep 1
iptables -F
iptables -t nat -F

# Add new settings
echo "Add new settings"
sleep 1
iptables -t nat -A PREROUTING -s xxx -p tcp --dport xxx -j DNAT --to :xxx

# Show current settings
echo "Show current settings"
sleep 1
echo "-------------------------------"
iptables -L
echo "-------------------------------"
iptables -t nat -L

exit
