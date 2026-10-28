class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.5.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.5/logos_v0.5.5_darwin_arm64.tar.gz"
      sha256 "bc4d049aa794c72918e5dd618c1bf9ef678c39526d7310f3c88177532453674d"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.5/logos_v0.5.5_darwin_amd64.tar.gz"
      sha256 "47880873b7c457cab9854d167cf480411243d43f2822ad0e9fcbec8fcd9d04c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.5/logos_v0.5.5_linux_arm64.tar.gz"
      sha256 "7c609ab34618a556a31e209c547b7c29a4cd8c484ee822e46525a5470c20a835"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.5/logos_v0.5.5_linux_amd64.tar.gz"
      sha256 "81ed52e0f2a9f871831eeaa25bdacf238a7467f31402c558654185017ac10dc4"
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
