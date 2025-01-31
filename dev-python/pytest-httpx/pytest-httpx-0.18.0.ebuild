# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

MY_PN="${PN/-/_}"
DESCRIPTION="Send responses to HTTPX using pytest"
HOMEPAGE="https://colin-b.github.io/pytest_httpx/"
SRC_URI="
	https://github.com/Colin-b/${MY_PN}/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="
	=dev-python/httpx-0.21*[${PYTHON_USEDEP}]
	=dev-python/pytest-6*[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests --install pytest
