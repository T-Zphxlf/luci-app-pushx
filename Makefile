include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-pushbotx
PKG_VERSION:=1.00
PKG_RELEASE:=1

PKG_MAINTAINER:=tty228 <tty228@yeah.net>  zzsj0928

LUCI_TITLE:=LuCI support for PushbotX (Bandix traffic)
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+iputils-arping +curl +jq +bandix

define Package/$(PKG_NAME)/conffiles
/etc/config/pushbotx
/usr/bin/pushbotx/api/diy.json
/usr/bin/pushbotx/api/ipv4.list
/usr/bin/pushbotx/api/ipv6.list
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
# 确保执行权限
chmod +x /usr/bin/pushbotx/pushbotx 2>/dev/null
# 创建临时目录
mkdir -p /tmp/pushbotx 2>/dev/null
# 注册开机自启
/etc/init.d/pushbotx enable 2>/dev/null
exit 0
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
