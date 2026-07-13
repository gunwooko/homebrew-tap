class Devx < Formula
  desc "Manage AI coding projects and tmux sessions"
  homepage "https://github.com/gunwooko/devx"
  version "0.1.2"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gunwooko/devx/releases/download/v0.1.2/devx_v0.1.2_darwin_arm64"
      sha256 "f85c68f6d9e74d8120478625501f868342902377f841ccf4dda441d84a8e0d1d"
    else
      url "https://github.com/gunwooko/devx/releases/download/v0.1.2/devx_v0.1.2_darwin_amd64"
      sha256 "70c90819a93db5ad07879b3bcab9816551393fef4e28fd378c78107b2ecda1cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gunwooko/devx/releases/download/v0.1.2/devx_v0.1.2_linux_arm64"
      sha256 "48fe0f2acaf1595a82f57d8df930ca07ee02e5f41375acbfb337077190ec02b6"
    else
      url "https://github.com/gunwooko/devx/releases/download/v0.1.2/devx_v0.1.2_linux_amd64"
      sha256 "020bc5700b6c147130a11518725b76684f63bc62532d4c7c828123fa3b9b82b5"
    end
  end

  def install
    bin.install Dir["devx_*"].first => "devx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devx --version")
  end
end
