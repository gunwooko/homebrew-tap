class Devx < Formula
  desc "Manage AI coding projects and tmux sessions"
  homepage "https://github.com/gunwooko/devx"
  version "0.1.3"
  license "MIT"

  depends_on "tmux"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gunwooko/devx/releases/download/v0.1.3/devx_v0.1.3_darwin_arm64"
      sha256 "9352cad4998cd3540d5353f9d49569fe492ec9fe0ae2a2bac958d73ad6c5af57"
    else
      url "https://github.com/gunwooko/devx/releases/download/v0.1.3/devx_v0.1.3_darwin_amd64"
      sha256 "09f4b9e21f71c434445d41d75f3bb2b8278febacce4d0d8940d920eddb6b3af3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/gunwooko/devx/releases/download/v0.1.3/devx_v0.1.3_linux_arm64"
      sha256 "a63c728b6beafe4cab16233b9470bbcbdba092aee81b3bbcf0eae3b3093db4e1"
    else
      url "https://github.com/gunwooko/devx/releases/download/v0.1.3/devx_v0.1.3_linux_amd64"
      sha256 "e1558920f12db18ca09037bbd3cb0fb5fc02d16939c32090eaccb5bd8039bd78"
    end
  end

  def install
    bin.install Dir["devx_*"].first => "devx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devx --version")
  end
end
