#!/bin/bash

#[core]
#	<...>
#	hooksPath = hooks

#set -x
set -e
set -u

# Validate .travis.yml file
git diff --cached --name-status --diff-filter=ACM | while read st file; do
    if [[ "$file" =~ (.travis.yml)$ ]]; then
        travis lint
    fi
done

exit 0
