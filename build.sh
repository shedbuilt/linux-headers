#!/bin/bash
declare -A SHED_PKG_LOCAL_OPTIONS=${SHED_PKG_OPTIONS_ASSOC}
SHED_PKG_LOCAL_HEADER_PATH="${SHED_FAKE_ROOT}/usr"
if [ -n "${SHED_PKG_LOCAL_OPTIONS[toolchain]}" ]; then
    SHED_PKG_LOCAL_HEADER_PATH="${SHED_FAKE_ROOT}/tools"
fi

# Build and Install
mkdir -v "$SHED_PKG_LOCAL_HEADER_PATH" &&
make INSTALL_HDR_PATH="$SHED_PKG_LOCAL_HEADER_PATH" headers_install &&
find "${SHED_PKG_LOCAL_HEADER_PATH}"/include \( -name .install -o -name ..install.cmd \) -delete
