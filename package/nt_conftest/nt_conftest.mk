################################################################################
#
# TRDP Conftest
#
################################################################################

NT_CONFTEST_VERSION = v1.00
#NT_CONFTEST_VERSION = bd11ea06c52cb93555d362310cdbe54a6476256a
#NT_CONFTEST_SITE = file:///opt/tcms/repository/ots_sources
NT_CONFTEST_SITE_METHOD = git
#NT_CONFTEST_SITE = $(call github,bremenyi,nt_conftest,$(NT_CONFTEST_VERSION))
NT_CONFTEST_SITE = ssh://git@github.com/bremenyi/nt_conftest.git
NT_CONFTEST_LICENSE = GPL-2.0
NT_CONFTEST_LICENSE_FILES = COPYING
NT_CONFTEST_DEPENDENCIES = tcnopen
NT_CONFTEST_BINS = main_test

define NT_CONFTEST_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LINUX_BR_config 
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) TCPREFIX=$(TARGET_CROSS) PD_PULL_SUPPORT=1 HIGH_PERF_INDEXED=1
endef

define NT_CONFTEST_INSTALL_TARGET_CMDS
	for prog in $(NT_CONFTEST_BINS); do \
		$(INSTALL) -D -m 0755 $(@D)/bld/output/br-rel/$$prog $(TARGET_DIR)/usr/bin/$$prog ; \
	done
endef

$(eval $(generic-package))
