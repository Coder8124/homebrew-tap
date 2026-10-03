class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.0/logos_v0.5.0_darwin_arm64.tar.gz"
      sha256 "9b4e7e8a6a8c3cf9dc615c74997898a0da71555d26ed51d694039e60b6378798"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.0/logos_v0.5.0_darwin_amd64.tar.gz"
      sha256 "66d5fea54f821ae05bcd8c49b62310ea7549c4c25254cfca4ed41dfc325dc4ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.0/logos_v0.5.0_linux_arm64.tar.gz"
      sha256 "fd7d077edf4ea274537e50394625bf405cd2893dfe77d2d7e9fa7f6cd7be2546"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.0/logos_v0.5.0_linux_amd64.tar.gz"
      sha256 "f810936d5610969789e2b71d69676af18d4d8d99ae1abaecdc74ff5e6fbf90e1"
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
