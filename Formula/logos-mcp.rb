class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.5.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.3/logos_v0.5.3_darwin_arm64.tar.gz"
      sha256 "6948fe8d552d342e002291767990ea638a697e9e1a17d136b428e1823a499ad3"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.3/logos_v0.5.3_darwin_amd64.tar.gz"
      sha256 "295d714f305e1817c70c19e9ba690311945976e52b6d1c7e96e3562254f48078"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.3/logos_v0.5.3_linux_arm64.tar.gz"
      sha256 "672b4eeb98499cacf1449c1a5789598af19b8d2120e9aa5acfe1a54189d62754"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.3/logos_v0.5.3_linux_amd64.tar.gz"
      sha256 "7cdcd9bade552a6a77c279f2e48eed6b9c71f85fb0bdd9efa86de2f9805ce716"
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
