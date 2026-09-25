class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.4.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.9/logos_v0.4.9_darwin_arm64.tar.gz"
      sha256 "78f9add1e7bf32f647f498b6fdbe772bbf008d9f9e6ff14e90b33de0bade2f84"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.9/logos_v0.4.9_darwin_amd64.tar.gz"
      sha256 "61ab01201fdc4b55263dc7ad94bf8d3f448ce093b715a46a0030a40e7334ae18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.9/logos_v0.4.9_linux_arm64.tar.gz"
      sha256 "218010b1d8b79e226ef5fc9c8c82c42219b366dfe81d2e37ebfd8f234c11ddf9"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.9/logos_v0.4.9_linux_amd64.tar.gz"
      sha256 "e4af699c6b22e93327d21fccff9d3fa9a19fb9988d33316f25d471579443cda8"
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
