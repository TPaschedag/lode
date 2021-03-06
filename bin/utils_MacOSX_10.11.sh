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
    # To resolve issue with Xcode 9, we need to use Cmake 3.10:
    # https://gitlab.kitware.com/cmake/cmake/issues/17101
    install_private_cmake "3.10.0-rc3" "http://www.cmake.org/files/v3.10/" "cmake-3.10.0-rc3.tar.gz"
    install_doxygen "1.8.10" "http://ftp.stack.nl/pub/users/dimitri" "doxygen-1.8.10.src.tar.gz"
    install_generic_conf_make_install "ccache" "3.3.4" "https://www.samba.org/ftp/ccache" "ccache-3.3.4.tar.gz"
    install_generic_conf_make_install "gettext" "0.19.8" "http://ftp.gnu.org/pub/gnu/gettext" "gettext-0.19.8.tar.gz"
}

os_flavor_notes()
{
if [ -z "$(echo "$PATH" | grep "${BASE_DIR}/opt/bin")" ] ; then
    cat <<EOF
=============

    Add ${BASE_DIR}/opt/bin in front of your PATH before configuring
    or building libreoffice

EOF
fi
}
