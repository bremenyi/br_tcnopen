################################################################################
#
# TRDP
#
################################################################################

#TRDP_SITE_METHOD = svn
TRDP_VERSION = 2.0.0.1
TRDP_SITE = file:///opt/tcms/repository/ots_sources
TRDP_LICENSE = GPL-2.0
TRDP_LICENSE_FILES = COPYING

#TRDP_BINS = \
#	open2300 dump2300 log2300 fetch2300 wu2300 cw2300 history2300 \
#	histlog2300 bin2300 xml2300 light2300 interval2300 minmax2300
#TRDP_CFLAGS = $(TARGET_CFLAGS)
#TRDP_LDFLAGS = $(TARGET_LDFLAGS)

define TRDP_BUILD_CMDS
#	RMY: We do not build something for the first step. This has to be changed
#	     if NEWTEC Conftest is corrected!
#	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LINUX_RPI4_config 
#	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define TRDP_INSTALL_TARGET_CMDS
#	for prog in $(TRDP_BINS); do \
#		$(INSTALL) -D -m 0755 $(@D)/$$prog $(TARGET_DIR)/usr/bin/$$prog ; \
#	done
endef

$(eval $(generic-package))
