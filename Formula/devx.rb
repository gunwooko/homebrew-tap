class Devx < Formula
  desc "Manage AI coding projects and tmux sessions"
  homepage "https://github.com/gunwooko/devx"
  version "0.1.1"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gunwooko/devx/releases/download/v0.1.1/devx_v0.1.1_darwin_arm64"
      sha256 "f64b078e9d16e427d8d35c7fb6eb5c96bb44edab7da082c9203177dcd6c476d7"
    else
      url "https://github.com/gunwooko/devx/releases/download/v0.1.1/devx_v0.1.1_darwin_amd64"
      sha256 "eb50104e9929dcfc0e034bd2d8f160f6ea267adbb0d2d8702abf84e645ed160e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gunwooko/devx/releases/download/v0.1.1/devx_v0.1.1_linux_arm64"
      sha256 "cd601c6dccaef6b88fff6ba389372028166e80cce3d04fa03a990a8d7c2b7a07"
    else
      url "https://github.com/gunwooko/devx/releases/download/v0.1.1/devx_v0.1.1_linux_amd64"
      sha256 "1c5f235020efcaf7fea0a7295ff473e9e6d3e56ce789352a899dc32ccfe9ee30"
    end
  end

  def install
    bin.install Dir["devx_*"].first => "devx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devx --version")
  end
end
