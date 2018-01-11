#!/bin/bash
make mrproper
case "$SHED_BUILDMODE" in
    toolchain)
        mkdir -v "${SHED_FAKEROOT}/tools"
        make INSTALL_HDR_PATH="${SHED_FAKEROOT}/tools" headers_install
    ;;
    *)
        mkdir -v "${SHED_FAKEROOT}/usr"
        make INSTALL_HDR_PATH="${SHED_FAKEROOT}/usr" headers_install
        find ${SHED_FAKEROOT}/usr/include \( -name .install -o -name ..install.cmd \) -delete
    ;;
esac
