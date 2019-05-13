#!/usr/bin/env bash

set -euo pipefail

IMAGE_NAME=${IMAGE_NAME:-py3}
IMAGE_VERSION=${IMAGE_VERSION:-latest}
[[ -n "${VARIABLE1:-}" ]] &&env+=(--env VARIABLE1="$VARIABLE1")
[[ -n "${VARIABLE2:-}" ]] &&env+=(--env VARIABLE2="$VARIABLE2")

volumes+=(--volume ${PWD}/data:/data)

_flags="--interactive"
[[ -t 0 && -t 1 ]] && _flags="${_flags} --tty"

[[ -n "${HTTP_PROXY:-}" ]] && env+=(--env HTTP_PROXY="$HTTP_PROXY")
[[ -n "${HTTP_PROXY:-}" ]] && env+=(--env HTTPS_PROXY="$HTTP_PROXY")
env+=(--env PYTHONHTTPSVERIFY=0)

env+=(--env HTTP_PROXY="$http_proxy")
env+=(--env HTTPS_PROXY="$http_proxy")
env+=(--env PYTHONHTTPSVERIFY=0)
env+=(--env CURL_CA_BUNDLE="")

# env or volumes may be an empty array which bash treats as unset
set +u
exec docker run \
  --rm \
  ${_flags} \
  "${volumes[@]}" \
  "${env[@]}" \
  "${IMAGE_NAME}:${IMAGE_VERSION}" \
  "$@"
