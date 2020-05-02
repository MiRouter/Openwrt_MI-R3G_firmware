#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
#./scripts/feeds clean
#./scripts/feeds update -a
#./scripts/feeds install -a
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/luci-app-adguardhome
#git clone https://github.com/fw876/helloworld package/helloworld
git clone https://github.com/jerrykuku/lua-maxminddb package/helloworld/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr package/helloworld/luci-app-vssr
#git clone https://github.com/kenzok8/openwrt-packages package/op-packages
#./scripts/feeds clean
./scripts/feeds update -a
./scripts/feeds install -a
rm -rf package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon package/lean/luci-theme-argon
