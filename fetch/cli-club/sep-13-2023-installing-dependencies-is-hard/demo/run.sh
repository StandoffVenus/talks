#!/usr/bin/env sh

set -x

nix-shell -p git --run "git --version"
