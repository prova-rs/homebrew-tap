class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.16.1"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.16.1/prova-v0.16.1-linux-x86_64.tar.gz"
      sha256 "70bde18cc2df033797af66ad91a061f644bb2b3d4313fc8b6f6db135739ef1e7"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.16.1/prova-v0.16.1-linux-arm64.tar.gz"
      sha256 "76de8208cc2147a40cddde86c3c1a436756053868a039ef9239d6d49db694b2d"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.16.1/prova-v0.16.1-macos-arm64.tar.gz"
      sha256 "7da484f83a05c81be82edd237147c7517e385181cb33acc1ddf59e00a3a5e83e"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
