#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# Add SCUTClient
git clone https://github.com/scutclient/scutclient package/scutclient

# Add SmartDNS
svn co https://github.com/pymumu/smartdns/trunk/package/openwrt package/new/smartdns
git clone -b lede --single-branch https://github.com/pymumu/luci-app-smartdns package/new/luci-app-smartdns/

# Add OLED
git clone -b master --single-branch https://github.com/NateLol/luci-app-oled package/new/luci-app-oled

# Add AutoCore
svn co https://github.com/project-openwrt/openwrt/branches/master/package/lean/autocore package/lean/autocore
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/coremark package/lean/coremark
mkdir package/lean/coremark/patches
wget -P package/lean/coremark/patches/ https://raw.githubusercontent.com/QiuSimons/Others/master/coremark.patch
