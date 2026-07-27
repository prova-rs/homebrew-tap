class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.13.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.13.0/prova-v0.13.0-linux-x86_64.tar.gz"
      sha256 "2a22fc2d0648a86ccc6aad3a20b84c251ec13a7920189a2718c817cb18cb6718"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.13.0/prova-v0.13.0-linux-arm64.tar.gz"
      sha256 "719df0b6f067d0548524ca0c595439c039d589a2b752a43662bff5e1e8d34ed7"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.13.0/prova-v0.13.0-macos-arm64.tar.gz"
      sha256 "70e7e2f8b8dd326f26f44651487d1a63945412ee56a5c9c0d761b18b1de1c6a8"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
