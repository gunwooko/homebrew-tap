class Devx < Formula
  desc "Manage AI coding projects and tmux sessions"
  homepage "https://github.com/gunwooko/devx"
  version "0.1.0"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gunwooko/devx/releases/download/v0.1.0/devx_v0.1.0_darwin_arm64"
      sha256 "0ce53d039581f3b609395a7e1a839c6aa864a8db94a91b456797a99c42b68f3a"
    else
      url "https://github.com/gunwooko/devx/releases/download/v0.1.0/devx_v0.1.0_darwin_amd64"
      sha256 "9555f3e1b0745314f4f913933f24eefd31d105b02165143999b41de124b1b46d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gunwooko/devx/releases/download/v0.1.0/devx_v0.1.0_linux_arm64"
      sha256 "c6af8d2f2f49535ed954d4f181dcdeb69c39a39794e488520d32fce2f5251014"
    else
      url "https://github.com/gunwooko/devx/releases/download/v0.1.0/devx_v0.1.0_linux_amd64"
      sha256 "ba315a61b2adbea1156c29e5fd9ef8ba3887870e2c5faffa9deb3ad73eef7dbb"
    end
  end

  def install
    bin.install Dir["devx_*"].first => "devx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devx --version")
  end
end
