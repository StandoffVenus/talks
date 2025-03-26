#!/usr/bin/env sh

set -x

GITDIR="$(mktemp -d)"
git clone https://github.com/golang/example "${GITDIR}"
