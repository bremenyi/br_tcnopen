################################################################################
#
# TRDP
#
################################################################################

TCNOPEN_SITE = https://svn.code.sf.net/p/tcnopen/trdp/trunk/trdp
TCNOPEN_SITE_METHOD = svn
TCNOPEN_VERSION = 2162
TCNOPEN_LICENSE = GPL-2.0
TCNOPEN_LICENSE_FILES = COPYING
TCNOPEN_INSTALL_STAGING = YES

define TCNOPEN_BUILD_CMDS
	$(TARGET_MAKE_ENV) make -j1 -C $(@D) LINUX_BR_config 
	$(TARGET_MAKE_ENV) make -j1 -C $(@D) TCPREFIX=$(TARGET_CROSS) TCNOPEN_ENDIAN=$(BR2_ENDIAN) PD_PULL_SUPPORT=1 HIGH_PERF_INDEXED=1
endef

define TCNOPEN_INSTALL_TARGET_CMDS
#	for prog in $(TCNOPEN_BINS); do \
#		$(INSTALL) -D -m 0755 $(@D)/$$prog $(TARGET_DIR)/usr/bin/$$prog ; \
#	done
endef

define TCNOPEN_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D) install
endef

$(eval $(generic-package))
