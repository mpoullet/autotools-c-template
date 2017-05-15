#!/bin/sh
set -e
set -u
git clean -fdx
autoreconf --force --verbose --warnings=all --install
echo "\nPlease run ./configure\n"
