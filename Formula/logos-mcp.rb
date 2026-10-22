class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.5.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.4/logos_v0.5.4_darwin_arm64.tar.gz"
      sha256 "820c2f084f0a02353fc62d3e29f7c1f4e3f0e0385db5e210157d48491953215e"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.4/logos_v0.5.4_darwin_amd64.tar.gz"
      sha256 "fe8c3cb56a8db34a2dc0564a4b216003b21cf1f370c5f1484a8cda1f4f3a4e63"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.4/logos_v0.5.4_linux_arm64.tar.gz"
      sha256 "b983e6c566749c5cc81dfac625f08774448ad71e4d9f62b650146051cda48def"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.4/logos_v0.5.4_linux_amd64.tar.gz"
      sha256 "dae2610652b0d1897f3a7fde1fda1ae0f14507da9913ea415a2bdb84fc8ad1d7"
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
