#!/bin/bash
# FIXME: use autoconf/automake

# requires libseccomp >= v2.5.0
: ${LIBSECCOMP_PREFIX:=/opt/libseccomp/lib}
LIBSECCOMP="${LIBSECCOMP_PREFIX}/libseccomp.a"

if [ ! -e ${LIBSECCOMP} ] ; then
	LIBSECCOMP=`whereis libseccomp | tr ' ' '\n' | grep \.a$`
fi
echo "Using ${LIBSECCOMP}..."

set -eux -o pipefail
gcc -static -o subuidless -I${LIBSECCOMP_PREFIX}/include *.c pb/*.c ${LIBSECCOMP} -lprotobuf-c

strip subuidless
