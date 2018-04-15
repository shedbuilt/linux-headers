#!/bin/bash
case "$SHED_BUILD_MODE" in
    toolchain)
        mkdir -v "${SHED_FAKE_ROOT}/tools" &&
        make INSTALL_HDR_PATH="${SHED_FAKE_ROOT}/tools" headers_install
    ;;
    *)
        mkdir -v "${SHED_FAKE_ROOT}/usr" &&
        make INSTALL_HDR_PATH="${SHED_FAKE_ROOT}/usr" headers_install &&
        find "${SHED_FAKE_ROOT}/usr/include" \( -name .install -o -name ..install.cmd \) -delete
    ;;
esac
