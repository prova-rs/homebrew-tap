class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.16.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.16.0/prova-v0.16.0-linux-x86_64.tar.gz"
      sha256 "aff31a7d5b4fe92aa6318d0fc8a332669d97c1510dc5810573fb90f4b7949db1"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.16.0/prova-v0.16.0-linux-arm64.tar.gz"
      sha256 "25661aa53ff8c3f4cca5f8701668fd4631dc01738d7176e5454ba040a61e37cc"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.16.0/prova-v0.16.0-macos-arm64.tar.gz"
      sha256 "d7beea7c52df3599b87247fcb678d2feb14dd187e4fe35518715ca112d57eee9"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
