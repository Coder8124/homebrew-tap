class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.4.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.8/logos_v0.4.8_darwin_arm64.tar.gz"
      sha256 "852511966ff1fbad906bda27f64310d4cca14090d51b3030d1e31637b08afaf4"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.8/logos_v0.4.8_darwin_amd64.tar.gz"
      sha256 "593a31cdf2b796a2d0bc529990e48a47e4259d60fdc619ac106f7f4cd253e430"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.8/logos_v0.4.8_linux_arm64.tar.gz"
      sha256 "68517cb95fbb39ac59f889a65d795700d21e3ef563bafdae2c9b9cf31aa81cc1"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.8/logos_v0.4.8_linux_amd64.tar.gz"
      sha256 "0ddbdada301e7130da4b09d1cd056239150522191b945ad36f2296314aa8ee0a"
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
