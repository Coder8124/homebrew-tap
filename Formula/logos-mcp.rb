class LogosMcp < Formula
  desc "Cross-tool memory and continuity for AI coding agents, over MCP"
  homepage "https://github.com/Coder8124/logos"
  version "0.4.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.5/logos_v0.4.5_darwin_arm64.tar.gz"
      sha256 "9369740a712524be73ec4f11640b3d28de1d8814103ce49ed23ae626f9303535"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.5/logos_v0.4.5_darwin_amd64.tar.gz"
      sha256 "654165d8daa9e59cfc6680d140258b7805edc752b611b43d2750e4e8dc538ee2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.5/logos_v0.4.5_linux_arm64.tar.gz"
      sha256 "8997b3bb1439d406e1b3bc408f2356402be8815c2992d2d982907eaedb252154"
    end
    on_intel do
      url "https://github.com/Coder8124/logos/releases/download/v0.4.5/logos_v0.4.5_linux_amd64.tar.gz"
      sha256 "3dc193e7e841be7549796c049c9e632a77e143733cab311856565b22b4fd8ead"
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
