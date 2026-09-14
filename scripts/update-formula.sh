#!/usr/bin/env bash
# Rewrite Formula/logos.rb for a logos release from that release's SHA256SUMS,
# so no checksum in the formula is ever typed by hand.
#
#   scripts/update-formula.sh v0.4.3
#
# RELEASE_BASE points at somewhere other than the GitHub release, for testing a
# formula against archives built locally by logos's scripts/release.sh
# (e.g. RELEASE_BASE=file:///tmp/rel).
set -euo pipefail

TAG="${1:?usage: update-formula.sh vX.Y.Z}"
case "$TAG" in v*) ;; *) TAG="v$TAG" ;; esac
VERSION="${TAG#v}"
BASE="${RELEASE_BASE:-https://github.com/Coder8124/logos/releases/download/${TAG}}"
FORMULA="$(cd "$(dirname "$0")/.." && pwd)/Formula/logos.rb"

sums="$(curl -fsSL "${BASE}/SHA256SUMS")"

sha() {
  local name="logos_${TAG}_$1.tar.gz"
  local s
  s="$(awk -v n="$name" '{f=$2; sub(/^\.\//, "", f); if (f == n) print $1}' <<<"$sums")"
  if [ -z "$s" ]; then
    echo "SHA256SUMS for ${TAG} has no ${name}" >&2
    exit 1
  fi
  echo "$s"
}

cat >"$FORMULA" <<RUBY
class Logos < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "${VERSION}"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "${BASE}/logos_${TAG}_darwin_arm64.tar.gz"
      sha256 "$(sha darwin_arm64)"
    end
    on_intel do
      url "${BASE}/logos_${TAG}_darwin_amd64.tar.gz"
      sha256 "$(sha darwin_amd64)"
    end
  end

  on_linux do
    on_arm do
      url "${BASE}/logos_${TAG}_linux_arm64.tar.gz"
      sha256 "$(sha linux_arm64)"
    end
    on_intel do
      url "${BASE}/logos_${TAG}_linux_amd64.tar.gz"
      sha256 "$(sha linux_amd64)"
    end
  end

  def install
    bin.install "logos"
  end

  def caveats
    <<~EOS
      Connect every MCP host on this machine to one vault:
        logos setup

      Hosts are wired to #{opt_bin}/logos, which keeps working after
      \`brew upgrade logos\`. Update with brew, not \`logos update\`.
    EOS
  end

  test do
    assert_match "logos v#{version}", shell_output("#{bin}/logos --version")
  end
end
RUBY

echo "wrote ${FORMULA} for ${TAG}"
