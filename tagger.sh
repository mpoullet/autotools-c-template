#!/bin/bash
set -e
set -u
#set -x

# extract AC_INIT package and version
PACKAGE=$(sed -nr "/^AC_INIT\b/{ s/^[^(]*\([ 	]*([^,	 ]+).*/\1/; s/\[|]//g; p; }" configure.ac)
echo PACKAGE="$PACKAGE"

VERSION=$(sed -nr "/^AC_INIT\b/{ s/^[^,]*,[^0-9]*([0-9.]*).*/\1/; p; }" configure.ac)
[[ $VERSION =~ ^[0-9.]+$ ]] || die "failed to detect package version"
echo VERSION="$VERSION"

if git show-ref --tags --quiet --verify -- "refs/tags/$VERSION"
then
echo "tag $VERSION already exists"
exit 1
else
git tag "$VERSION"
fi
