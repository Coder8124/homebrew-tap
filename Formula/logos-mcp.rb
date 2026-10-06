class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.1/logos_v0.5.1_darwin_arm64.tar.gz"
      sha256 "5b6db177011344920d65aaf31bcbda9e4ce261532c82f2437462282d5bf4e8ea"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.1/logos_v0.5.1_darwin_amd64.tar.gz"
      sha256 "908e1ae6016b02e053db2f4b94dc914d328cda0c2df1e96ade9eb21315cc5550"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.1/logos_v0.5.1_linux_arm64.tar.gz"
      sha256 "c8c0df7c0dd22b58566e65f7ade0b984cbcbaf3804741591f7255d9ac142625b"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.5.1/logos_v0.5.1_linux_amd64.tar.gz"
      sha256 "c22907858bdc352480fee32675510934cdcf88ccb7b2bafe601e1dd3ca20bd12"
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
