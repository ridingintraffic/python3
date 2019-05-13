#!/usr/bin/env bash

set -euo pipefail

#case "${1:-help}" in
#"help" | "-h" | "-help" | "--help")
#  shift
#  exec /cmd/help "$@"
#  ;;
#esac

#CMD_PATHS="$(find /cmd -type d -mindepth 1 -maxdepth 1 | tr '\n' :)"
#export PATH="${CMD_PATHS}${PATH}"
#
exec "$@"
