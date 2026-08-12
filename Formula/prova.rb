class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.20.2"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.20.2/prova-v0.20.2-linux-x86_64.tar.gz"
      sha256 "d4ec09e77aa49ceb96b66ea3e19f75dfa1821dfc8abe5e8f355f8bdf3f0d6af6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.20.2/prova-v0.20.2-linux-arm64.tar.gz"
      sha256 "b789e525b9a6663bd2c11f62a1b51ae34efb6d388b5390cb086d441d2f2d3078"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.20.2/prova-v0.20.2-macos-arm64.tar.gz"
      sha256 "9a2ba5ffd8a80ae696b88f10ab40bd1398ff7477431f9779dc70cd761866bea2"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
