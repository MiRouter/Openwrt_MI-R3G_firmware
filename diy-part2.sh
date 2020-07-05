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
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/diy-packages/luci-app-adguardhome
# 获取hello world和依赖
git clone https://github.com/jerrykuku/lua-maxminddb package/diy-packages/helloworld/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr package/diy-packages/helloworld/luci-app-vssr
# 获取passwall
# git clone -b 3.6-40 https://github.com/liuran001/luci-app-passwall package/diy-packages/passwall
# 获取Lienol-package
git clone https://github.com/Lienol/openwrt-package package/diy-packages/lienol
# 获取luci-app-diskman和依赖
mkdir -p package/diy-packages/luci-app-diskman && \
mkdir -p package/diy-packages/parted && \
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Makefile -O package/diy-packages/luci-app-diskman/Makefile
wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/Parted.Makefile -O package/diy-packages/parted/Makefile
# 获取luci-app-serverchan
git clone https://github.com/tty228/luci-app-serverchan package/diy-packages/luci-app-serverchan
# 获取luci-app-openclash 编译po2lmo
git clone -b master https://github.com/vernesong/OpenClash package/diy-packages/openclash
pushd package/diy-packages/openclash/luci-app-openclash/tools/po2lmo
make && sudo make install
popd
#=================================================
# 清除默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
#=================================================
# 清除旧版argon主题并拉取最新版
pushd package/lean
rm -rf luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon luci-theme-argon
popd
#=================================================
#=================================================
# 修改BaiduPCS-web来源
#pushd package/lean
#rm -rf baidupcs-web
#git clone https://github.com/liuran001/baidupcs-web-lede baidupcs-web
#popd