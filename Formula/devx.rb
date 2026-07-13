class Devx < Formula
  desc "Manage AI coding projects and tmux sessions"
  homepage "https://github.com/gunwooko/devx"
  version "0.1.4"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gunwooko/devx/releases/download/v0.1.4/devx_v0.1.4_darwin_arm64"
      sha256 "3c2846c942ad3403ec6a1eef66445ceffed57aba3d6596081261b87bdc501866"
    else
      url "https://github.com/gunwooko/devx/releases/download/v0.1.4/devx_v0.1.4_darwin_amd64"
      sha256 "9bef2f0d301f2224326a361dc1fe0e50e3ce15e74f592e494bd915e77799c0d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gunwooko/devx/releases/download/v0.1.4/devx_v0.1.4_linux_arm64"
      sha256 "8297ca019419d95459fb86216d43c40d09b8ace74a729799ce4e8fd6236f259b"
    else
      url "https://github.com/gunwooko/devx/releases/download/v0.1.4/devx_v0.1.4_linux_amd64"
      sha256 "305676135b1bbdd18ceb4df260fba6dbb99bdbdcb6312cebfb3eceaadff358e8"
    end
  end

  def install
    bin.install Dir["devx_*"].first => "devx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devx --version")
  end
end
