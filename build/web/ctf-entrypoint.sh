#!/bin/sh
# CyberCTF per-player flag, added by the overlay (the vendored benchmark is unchanged).
# The Dockerfile bakes a development flag in at build time. At every start this wrapper puts
# the player's flag in its place (CTF_FLAG_MAIN, given by the launcher; else /ctf/flag, written
# by ctf/flag.sh on an earlier start; else the development flag), then starts the benchmark
# exactly as before.
dev='FLAG{dev-xben-093-pay-me-back}'
baked='FLAG{d6fae569ba18941ce66b28e325fd4597bf4f223fb6abc9443ed539ef782eab6f}'
flag=${CTF_FLAG_MAIN:-}
if [ -z "$flag" ] && [ -s /ctf/flag ]; then flag=$(cat /ctf/flag); fi
[ -n "$flag" ] || flag=$dev
# The benchmark reads the flag from the FLAG environment variable.
export FLAG="$flag"
unset CTF_FLAG_MAIN
exec "$@"
