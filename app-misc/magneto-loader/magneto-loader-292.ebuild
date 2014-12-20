# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit eutils python-single-r1

DESCRIPTION="Official Kogaion Linux Entropy Notification Applet Loader"
HOMEPAGE="http://www.rogentos.ro"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

SRC_URI="mirror://kogaion/sys-apps/entropy-${PV}.tar.bz2"
S="${WORKDIR}/entropy-${PV}/magneto"

DEPEND="${PYTHON_DEPS}
	~sys-apps/magneto-core-${PV}[${PYTHON_USEDEP}]
	~app-admin/rigo-${PV}[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_install() {
	emake DESTDIR="${D}" LIBDIR="usr/lib" magneto-loader-install || die "make install failed"
}
