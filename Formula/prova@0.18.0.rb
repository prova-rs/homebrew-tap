class ProvaAT0_18_0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.18.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.18.0/prova-v0.18.0-linux-x86_64.tar.gz"
      sha256 "34b4fc69eaad815b6fd1dc33f220ace3fc5f840b79e0fdc9d4391b298bb9791e"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.18.0/prova-v0.18.0-linux-arm64.tar.gz"
      sha256 "fe0e52e180a725209a40f4642f772411e7134f7fd36d19d19b428aea95887569"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.18.0/prova-v0.18.0-macos-arm64.tar.gz"
      sha256 "07a79a55cd3189d2a5e35330389f0a778f0da4791a43d748367bb3c28ca16c27"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
