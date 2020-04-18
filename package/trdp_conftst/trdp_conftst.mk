################################################################################
#
# TRDP Conftest
#
################################################################################

TRDP_CONFTST_VERSION = 1.0.0.0
TRDP_CONFTST_SITE = file:///opt/tcms/repository/ots_sources
TRDP_CONFTST_LICENSE = GPL-2.0
TRDP_CONFTST_LICENSE_FILES = COPYING

TRDP_CONFTST_BINS = main_test

define TRDP_CONFTST_BUILD_CMDS
	ln -s $(TRDP_SRCDIR) $(TRDP_CONFTST_SRCDIR)/trdp-sdk
	ln -s $(TRDP_CONFTST_SRCDIR)/trdp-sdk/tcnopen-trdp/2.0.2.0 $(TRDP_CONFTST_SRCDIR)/tcnopen-trdp
#NEWTECS build is broken for parallel builds (main_test / libinterface) 
#       -> use make -j1 instead of $(MAKE) 
	$(TARGET_MAKE_ENV) make -j1 -C $(@D) LINUX_RPI4_config 
	$(TARGET_MAKE_ENV) make -j1 -C $(@D) PD_PULL_SUPPORT=1 HIGH_PERF_INDEXED=1
endef

define TRDP_CONFTST_INSTALL_TARGET_CMDS
	for prog in $(TRDP_CONFTST_BINS); do \
		$(INSTALL) -D -m 0755 $(@D)/bld/output/rpi4-linux-gnu-rel/$$prog $(TARGET_DIR)/usr/bin/$$prog ; \
	done
endef

$(eval $(generic-package))
