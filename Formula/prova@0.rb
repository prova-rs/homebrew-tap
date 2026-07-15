class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.2.1"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.1/prova-v0.2.1-linux-x86_64.tar.gz"
      sha256 "4ba58f023745728733505af4479288e86ef3a874f74c53decd12095dd9fe5e51"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.1/prova-v0.2.1-linux-arm64.tar.gz"
      sha256 "549c2741d8169abcbf0b6cb3a3cee01af11b026d8a5e46a86aad2c9acd51dc2a"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.1/prova-v0.2.1-macos-arm64.tar.gz"
      sha256 "5b081996606170baa5ee29a92154f185b8b290caf35b15843920b90f1f5a3eb2"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
