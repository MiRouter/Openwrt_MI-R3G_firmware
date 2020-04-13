#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/feeds/luci/luci-app-adguardhome
cd ..
git clone https://github.com/Lienol/openwrt-package lede-package/
cd openwrt/package/feeds/luci/
mv -f /lede-package/lienol/* .
./scripts/feeds update -a
./scripts/feeds install -a
