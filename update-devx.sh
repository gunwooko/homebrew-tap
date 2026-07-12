#!/usr/bin/env bash
# Bump Formula/devx.rb to a released devx version.
# Usage: ./update-devx.sh v0.2.0
set -euo pipefail

tag="${1:?usage: $0 <tag, e.g. v0.2.0>}"
version="${tag#v}"
base="https://github.com/gunwooko/devx/releases/download/${tag}"
formula="$(dirname "$0")/Formula/devx.rb"

sha() {
  curl -sfL "${base}/devx_${tag}_$1" | shasum -a 256 | cut -d' ' -f1
}

darwin_arm64=$(sha darwin_arm64)
darwin_amd64=$(sha darwin_amd64)
linux_arm64=$(sha linux_arm64)
linux_amd64=$(sha linux_amd64)

perl -0pi -e "
  s/version \"[^\"]+\"/version \"${version}\"/;
  s#download/v[0-9][^/]*/devx_v[0-9][^_]*_#download/${tag}/devx_${tag}_#g;
" "$formula"

perl -0pi -e "
  s/(darwin_arm64\"\n\s+sha256 \")[a-f0-9]+/\${1}${darwin_arm64}/;
  s/(darwin_amd64\"\n\s+sha256 \")[a-f0-9]+/\${1}${darwin_amd64}/;
  s/(linux_arm64\"\n\s+sha256 \")[a-f0-9]+/\${1}${linux_arm64}/;
  s/(linux_amd64\"\n\s+sha256 \")[a-f0-9]+/\${1}${linux_amd64}/;
" "$formula"

echo "Updated ${formula} to ${tag}"
git -C "$(dirname "$0")" diff -- Formula/devx.rb
