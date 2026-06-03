include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-PushX
PKG_VERSION:=1.00
PKG_RELEASE:=1

PKG_MAINTAINER:=tty228 <tty228@yeah.net>  zzsj0928

LUCI_TITLE:=LuCI support for PushX (Bandix traffic)
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+iputils-arping +curl +jq +bandix

define Package/$(PKG_NAME)/conffiles
/etc/config/pushx
/usr/bin/pushx/api/diy.json
/usr/bin/pushx/api/ipv4.list
/usr/bin/pushx/api/ipv6.list
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature