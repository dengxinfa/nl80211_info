#
# Copyright (C) 2011-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=nl80211_info
PKG_RELEASE:=1
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

define Package/nl80211_info
  SECTION:=base
  CATEGORY:=test
  TITLE:=Listen event of nl80211
  DEPENDS:= +libnl-tiny
endef

define Build/Prepare
	$(INSTALL_DIR) $(PKG_BUILD_DIR)
	$(INSTALL_DATA) ./src/* $(PKG_BUILD_DIR)/
endef

ifdef CONFIG_TARGET_ipq
    TARGET_CFLAGS += $(FPIC)
endif

define Package/nl80211_info/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/nl80211_info $(1)/usr/bin/
endef

$(eval $(call BuildPackage,nl80211_info))
