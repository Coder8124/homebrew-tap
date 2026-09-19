class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.4.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.6/logos_v0.4.6_darwin_arm64.tar.gz"
      sha256 "33d7a29efdb3ff0905aeab2815e529d6dae5ff8d151e34e34f99a7e0f387c4f4"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.6/logos_v0.4.6_darwin_amd64.tar.gz"
      sha256 "3e1587c7327a25d420bb5b8f3f204276ed1997d28a2461f7130339baa3f7923e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.6/logos_v0.4.6_linux_arm64.tar.gz"
      sha256 "8dc93d1ebdea735ef9a37ae16c350ae2d9131b050306b3a08e52c8dd67d15a3c"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.6/logos_v0.4.6_linux_amd64.tar.gz"
      sha256 "65c3ee97a2417fae8887bde97e0a6d16251bdde046c1b69ef8dfb7dd25c7ee9e"
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
