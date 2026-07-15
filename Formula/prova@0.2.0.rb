class ProvaAT0_2_0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.2.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.0/prova-v0.2.0-linux-x86_64.tar.gz"
      sha256 "8ed74b80502dfb9b3a15e22d176392ceab4fef08c81899809d3d19f36966e76a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.0/prova-v0.2.0-linux-arm64.tar.gz"
      sha256 "6477f8ad30887e074f912cabfddece537f87ad836d79639f52eb3857c88fe78d"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.0/prova-v0.2.0-macos-arm64.tar.gz"
      sha256 "414691e1a9a3edaf58d1240599f99d917cf3499adf3c701cebb0f185e75ea7fd"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
