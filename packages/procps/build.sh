TERMUX_PKG_HOMEPAGE=https://packages.debian.org/sid/procps
TERMUX_PKG_DESCRIPTION="Utilities that give information about processes using the /proc filesystem"
TERMUX_PKG_VERSION=3.3.14
TERMUX_PKG_SHA256=5eda0253999b7d786e690edfa73301b3113c7a67058478866e98e9ff6736726c
TERMUX_PKG_SRCURL=https://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_BUILD_IN_SRC=yes
# error.h and stdio_ext.h in unified headers does
# not provide any functionality prior to android-23:
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
ac_cv_search_dlopen=
ac_cv_header_error_h=no
ac_cv_header_stdio_ext_h=no
--enable-sigwinch
--disable-modern-top
"
TERMUX_PKG_DEPENDS="ncurses"
# https://bugs.launchpad.net/ubuntu/+source/coreutils/+bug/141168:
# "For compatibility between distributions, can we have /bin/kill made available from coreutils?"
TERMUX_PKG_RM_AFTER_INSTALL="bin/kill share/man/man1/kill.1 usr/bin/w share/man/man1/w.1 usr/bin/slabtop share/man/man1/slabtop.1"

termux_step_pre_configure() {
	CFLAGS+=" -DHOST_NAME_MAX=255"
}
