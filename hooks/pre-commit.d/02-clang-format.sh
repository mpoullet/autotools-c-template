#!/bin/bash

#set -x
set -e
set -u

# This pre-commit hook checks if any versions of clang-format
# are installed, and if so, uses the installed version to format
# the staged changes.

maj_min=1
maj_max=3

base=clang-format
format=""

# Redirect output to stderr.
exec 1>&2

 # check if clang-format is installed
type "$base" >/dev/null 2>&1 && format="$base"

# if not, check all possible versions
# (i.e. clang-format-<$maj_min-$maj_max>-<0-9>)
if [ -z "$format" ]
then
    for j in $(seq $maj_max -1 $maj_min)
    do
        for i in $(seq 0 9)
        do
            type "$base-$j.$i" >/dev/null 2>&1 && format="$base-$j.$i" && break
        done
        [ -z "$format" ] || break
    done
fi

# no versions of clang-format are installed
if [ -z "$format" ]
then
    echo "$base is not installed. Pre-commit hook will not be executed."
    exit 0
fi

if git rev-parse --verify HEAD >/dev/null 2>&1
then
    against=HEAD
else
    # Initial commit: diff against an empty tree object
    against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# do the formatting
for file in $(git diff-index --cached --name-only $against)
do
    if [[ "$file" =~ .*\.(c|h|cpp|hpp|cc)$ ]]; then
        echo "Formatting $file..."
        "$format" -i "$file"
    else
        echo "Skipping $file..."
    fi
done
