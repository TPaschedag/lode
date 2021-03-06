# -*- tab-width : 4; indent-tabs-mode : nil -*-
#
#    Copyright (C) 2014 Norbert Thiebaud
#    License: GPLv3
#


install_build_dep()
{
    install_generic_conf_make_install "autoconf" "2.69" "http://mirrors.kernel.org/gnu/autoconf" "autoconf-2.69.tar.gz"
    install_generic_conf_make_install "automake" "1.14" "http://mirrors.kernel.org/gnu/automake" "automake-1.14.tar.gz"
    install_generic_conf_make_install "make" "4.1" "http://mirrors.kernel.org/gnu/make" "make-4.1.tar.gz"
    install_ant
    install_junit
    install_generic_conf_make_install "doxygen" "1.8.8" "http://ftp.stack.nl/pub/users/dimitri" "doxygen-1.8.8.src.tar.gz"
    install_generic_conf_make_install "ccache" "3.1.9" "https://www.samba.org/ftp/ccache" "ccache-3.1.9.tar.gz"
    install_generic_conf_make_install "gettext" "0.19.8" "http://ftp.gnu.org/pub/gnu/gettext" "gettext-0.19.8.tar.gz"
}

os_flavor_notes()
{
cat <<EOF
=============

    Add ${BASE_DIR}/opt/bin in front of your PATH before configuring
    or building libreoffice

EOF
}
