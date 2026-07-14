class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.1.1"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.1.1/prova-v0.1.1-linux-x86_64.tar.gz"
      sha256 "ae91da2f28258ad4b760fe3a668801fafbdfbd8244c9a2f7cf58a75630f3178b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.1.1/prova-v0.1.1-linux-arm64.tar.gz"
      sha256 "f7d99a2a47d5878975b972505c6598eb21b9ead6c67e39111cf50f83dd5586c4"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.1.1/prova-v0.1.1-macos-arm64.tar.gz"
      sha256 "b3f799271f234f9fd922d1b07654bbfd34cfcdc890b0edd12c05ec6a038de88d"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
