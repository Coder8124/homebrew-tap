class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.5.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.7/logos_v0.5.7_darwin_arm64.tar.gz"
      sha256 "486985e93d9d20e625070fe40fe0a54cfa75b6129d43e45a0981aa12cfac0a57"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.7/logos_v0.5.7_darwin_amd64.tar.gz"
      sha256 "98b91159e07bdbb27031e93d442eb8cc2236e88b74c370a20af52d030893922a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.7/logos_v0.5.7_linux_arm64.tar.gz"
      sha256 "4626c4a816f1b28f5a746b94ac788af0cdd98c7aa6a73315c9e935de1c6686a4"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.7/logos_v0.5.7_linux_amd64.tar.gz"
      sha256 "db3f5dde293c4d41ae5d471203377489a1f944e18e96b45b967ba4bf1b2ebb2e"
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
