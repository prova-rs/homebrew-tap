class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.26.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.26.0/prova-v0.26.0-linux-x86_64.tar.gz"
      sha256 "b60f9d33451f9c379b40cd91528dc663f93d64b490b857c07a5fb67d27141ba3"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.26.0/prova-v0.26.0-linux-arm64.tar.gz"
      sha256 "5bd9a97a47001ee29d43ba4598ea40abd763f54115d63a9a09092bd4ac85170e"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.26.0/prova-v0.26.0-macos-arm64.tar.gz"
      sha256 "523077b8b454761d08918628f1d0608ceeb41f3e98838826a499c1ddd0e29ff3"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
