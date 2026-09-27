class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.4.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.10/logos_v0.4.10_darwin_arm64.tar.gz"
      sha256 "037614c0d662a78847ba38dec717a2f217521217bc7c3cfd4e00d7b339f2d87b"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.10/logos_v0.4.10_darwin_amd64.tar.gz"
      sha256 "e8468c314b3e9b9143998e91c12d55f8fc592ee0a30e2a21b103bf5e89442103"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.10/logos_v0.4.10_linux_arm64.tar.gz"
      sha256 "0b288f9167d000b1265f95a2841aa173caf82f989660e13442eff6be8861c03c"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.10/logos_v0.4.10_linux_amd64.tar.gz"
      sha256 "ab71211c32ccc105ab781daf1c67b578fa6299d85eb027480dd23fd0f2013791"
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
