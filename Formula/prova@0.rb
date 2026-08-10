class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.19.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.19.0/prova-v0.19.0-linux-x86_64.tar.gz"
      sha256 "cf0878e245a20f29a56502d0457a5bac2a4490094fc118cfae06e07f90776691"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.19.0/prova-v0.19.0-linux-arm64.tar.gz"
      sha256 "1d6e885cc8b501dd8acf09a299ef29eb317e6d17bb61b9a2eba06a9e2108805e"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.19.0/prova-v0.19.0-macos-arm64.tar.gz"
      sha256 "89737510363dfc855f6315320c85c1a6c395e0a4685a77be8ed78392fcda0ea0"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
