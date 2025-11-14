#!/bin/sh
# based on @scriptingosx's work here
# https://scriptingosx.com/2025/08/building-simple-component-packages/

pkgname="BashFacts"
version="1.0"
identifier="com.github.magervalp.${pkgname}"
install_location="/usr/local/munki/conditions"

export PATH=/usr/bin:/bin:/usr/sbin:/sbin

projectfolder=$(dirname "$0")
payloadfolder="${projectfolder}/conditions"

# recursively clear all extended attributes
xattr -cr "${payloadfolder}"

# build the component package
pkgbuild --root "${payloadfolder}" \
         --identifier "${identifier}" \
         --version "${version}" \
         --install-location "${install_location}" \
         "${projectfolder}/${pkgname}-${version}.pkg"
