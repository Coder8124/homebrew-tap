class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.5.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.9/logos_v0.5.9_darwin_arm64.tar.gz"
      sha256 "3b039162a50560852290c8482f17d2e26e8968b7a5a32a11bf0a3c11363a9a75"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.9/logos_v0.5.9_darwin_amd64.tar.gz"
      sha256 "551073884cbb1d112e3a9c57e4f7888a83b21b46f199de110091ea0363b3adcb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.9/logos_v0.5.9_linux_arm64.tar.gz"
      sha256 "2919cb1b10b0c5c8978d1a94d4febc4d641fa09074e3dd178d8bf3468f2a59c9"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.9/logos_v0.5.9_linux_amd64.tar.gz"
      sha256 "42be49d521f0c24c1a0ccac579c6d1953febf2badc684056f45ff28155fcedfd"
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
