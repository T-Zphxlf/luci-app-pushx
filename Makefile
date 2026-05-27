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

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
