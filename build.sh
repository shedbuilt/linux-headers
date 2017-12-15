#!/bin/bash
make mrproper
mkdir -v ${SHED_FAKEROOT}/usr
make INSTALL_HDR_PATH=${SHED_FAKEROOT}/usr headers_install
find ${SHED_FAKEROOT}/usr/include \( -name .install -o -name ..install.cmd \) -delete
