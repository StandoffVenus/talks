#!/usr/bin/env sh

set -x

nix-shell -p go_1_21 git
