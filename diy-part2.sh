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
sed -i '/exit 0/i\uci set network.lan.ipaddr='192.168.1.254'\nuci set network.lan.proto='static'\nuci set network.lan.type='bridge'\nuci set network.lan.ifname='eth0'\nuci set network.lan.netmask='255.255.255.0'\nuci set network.lan.gateway='192.168.1.1'\nuci set network.lan.dns='192.168.1.1'\nuci commit network' package/lean/default-settings/files/zzz-default-settings

# Modify default passwork:00000000/qazwsx939
#sed -i -e 's#root::0:0:99999:7:::#root:$1$/YSxcdBO$bFuXE13KnaJb25YA8b6/1/:18825:0:99999:7:::#g' package/base-files/files/etc/shadow
sed -i -e 's#root::0:0:99999:7:::#root:$1$aiWMDYOa$LUY5AmiiEv1XWE4m7PVG4.:18843:0:99999:7:::#g' package/base-files/files/etc/shadow

# Download luci-app-Poweroff
git clone https://github.com/esirplayground/luci-app-poweroff.git package/lean/uci-app-poweroff

# Download OpenAppFilter
git clone https://github.com/destan19/OpenAppFilter.git package/lean/OpenAppFilter

# Change kernel
#sed -i 's/KERNEL_PATCHVER:=5.10/KERNEL_PATCHVER:=5.4/g' target/linux/x86/Makefile

# Frpc site
#sed -i "s/option enabled '0'/option enabled '1'/g" package/lean/luci-app-frpc/root/etc/config/frp
#sed -i 's/yourdomain.com/venseco.ga/g' package/lean/luci-app-frpc/root/etc/config/frp
#sed -i 's/1234567/qazwsx939/g' package/lean/luci-app-frpc/root/etc/config/frp
#echo "config proxy
     option enable '1'
     option type 'http'
     option domain_type 'custom_domains'
     option custom_domains 'lede.venseco.ga'
     option local_ip '192.168.1.254'
     option local_port '80'
     option proxy_protocol_version 'disable'
     option use_encryption '1'
     option use_compression '1'
     option remark 'openwrt'" >> package/lean/luci-app-frpc/root/etc/config/frp
