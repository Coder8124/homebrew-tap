class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.4.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.3/logos_v0.4.3_darwin_arm64.tar.gz"
      sha256 "e34d43c1cf08d7eb494b16aa5defe36189f95a47a7ceaf453b7662a5e803d1df"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.3/logos_v0.4.3_darwin_amd64.tar.gz"
      sha256 "db74a638978094e6e6e4d462f658681f5214420b09e642931304f0cc23f828a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.3/logos_v0.4.3_linux_arm64.tar.gz"
      sha256 "10612ac1d5943847a9411b3239b849a72e107b63b4f13ab2d6b979421633e2d3"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.3/logos_v0.4.3_linux_amd64.tar.gz"
      sha256 "05aec99ec253b0319b1b9541826574dcfc9ca70bda762fd6b5cfd2ac94845841"
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
