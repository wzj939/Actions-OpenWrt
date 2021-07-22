#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.1.254/g' package/base-files/files/bin/config_generate
sed -i '/exit 0/i\uci set network.lan.ipaddr='192.168.1.254'\nuci set network.lan.proto='static'\nuci set network.lan.type='bridge'\nuci set network.lan.ifname='eth0'\nuci set network.lan.netmask='255.255.255.0'\nuci set network.lan.gateway='192.168.1.1'\nuci set network.lan.dns='192.168.1.1'\nuci commit network\n ' package/lean/default-settings/files/zzz-default-settings

# Modify default passwork:00000000
sed -i 's/root::0:0:99999:7:::/root:$1$/YSxcdBO$bFuXE13KnaJb25YA8b6/1/:18825:0:99999:7:::/g' package/base-files/files/etc/shadow

# Download luci-app-Poweroff
git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/uci-app-poweroff
# Download OpenAppFilter
git clone https://github.com/destan19/OpenAppFilter.git package/lean/OpenAppFilter
