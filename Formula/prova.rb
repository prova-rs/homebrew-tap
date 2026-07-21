class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.3.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.3.0/prova-v0.3.0-linux-x86_64.tar.gz"
      sha256 "716f9fd9363a3c63350353924c5f20d3eeac05f40993c4c9ab038eb8399c57cb"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.3.0/prova-v0.3.0-linux-arm64.tar.gz"
      sha256 "25dde9495324c80fd689845a7816c64064652e7e96dce2c217c5f1fa7b5092da"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.3.0/prova-v0.3.0-macos-arm64.tar.gz"
      sha256 "4190ba767c59cb8ad8f32be7b5b8a687cf7e437dcf6a7c522904bf9c49b3b045"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
