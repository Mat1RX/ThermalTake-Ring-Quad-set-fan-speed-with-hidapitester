#!/bin/bash
x="$1" # Получаем значение x из аргумента командной строки

# Шаг 1: Получаем список путей устройств с vendorId: 0x264A и productId: 0x2267
device_paths=$(/var/home/hm/.local/bin/hidapitester --list-detail | awk -v RS='' '/264A\/2267:/ {print $NF}')

# Шаг 2: Выполняем команду с использованием каждого пути из списка
for path in $device_paths; do
  hidapitester --open-path "$path" --send-output "0x0,0x32,0x51,1,0x01,$x" > /dev/null
  hidapitester --open-path "$path" --send-output "0x0,0x32,0x51,2,0x01,$x" > /dev/null
  hidapitester --open-path "$path" --send-output "0x0,0x32,0x51,3,0x01,$x" > /dev/null
done


