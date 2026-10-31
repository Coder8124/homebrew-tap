class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.5.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.6/logos_v0.5.6_darwin_arm64.tar.gz"
      sha256 "7afb8b3edad34652b3a9b6e4c7ce34a83121898280eb8b3773026ef4afa48e45"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.6/logos_v0.5.6_darwin_amd64.tar.gz"
      sha256 "1c6faad468e79149d3a29107152cdc2d9932d3661eb4d828571cef3793819806"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.6/logos_v0.5.6_linux_arm64.tar.gz"
      sha256 "0112699b38588d72c163d9030cbb3340a61059d30242739ed8a488476e390eb4"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.6/logos_v0.5.6_linux_amd64.tar.gz"
      sha256 "f3457a75420fcdfd57707f0e0247190c7d636e7b583d4e1617cfde514eb419ef"
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
