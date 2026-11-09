class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.5.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.8/logos_v0.5.8_darwin_arm64.tar.gz"
      sha256 "309981e52ed66b8e140916e7e801701badc52fbd4d51278fd176210e2e195cd1"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.8/logos_v0.5.8_darwin_amd64.tar.gz"
      sha256 "5a429140e298d3d36e9483c01085c84cf0d32d75468f8d83c3c9f370e8b2dc4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.8/logos_v0.5.8_linux_arm64.tar.gz"
      sha256 "4c3460aec1e25aa09091a706f5f63fb9a5c50ebe8dba144784e7349cb56d9b09"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.8/logos_v0.5.8_linux_amd64.tar.gz"
      sha256 "b0811b659cbac54f882c3cdcb812de528b24e76ae94330b764947e098316e7c9"
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
      `brew upgrade logos-mcp`. Update with brew, not `logos update`.
    EOS
  end

  test do
    assert_match "logos v#{version}", shell_output("#{bin}/logos --version")
  end
end
