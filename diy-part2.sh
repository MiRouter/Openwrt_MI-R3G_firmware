#!/bin/bash
#=================================================
# Description: DIY script
# https://github.com/liuran001/Openwrt_MI-R3G_firmware
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# 这里的脚本在获取feeds后执行
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#git clone https://github.com/kenzok8/openwrt-packages package/op-packages
#=================================================
#=================================================
# 获取luci-app-adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
# 获取hello world和依赖
git clone https://github.com/jerrykuku/lua-maxminddb package/helloworld/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr package/helloworld/luci-app-vssr
#=================================================
#=================================================
# 清除旧版argon主题并拉取最新版
cd package/lean
rm -rf luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon luci-theme-argon
#=================================================
#=================================================
