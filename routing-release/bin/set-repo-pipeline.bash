#!/bin/bash

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
REPO="$DIR/.."
FLY_TEAM=wg-arp-networking

main() {
  local pipeline_dir="$(realpath $REPO/pipelines)"
  fly_login
  fly_pipeline routing-actions -f "${pipeline_dir}/routing-actions.yml" \
    -f "$REPO/index.yml" \
    -f "$REPO/../shared/helpers/ytt-helpers.star"
}

main
