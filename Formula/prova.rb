class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.9.1"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.9.1/prova-v0.9.1-linux-x86_64.tar.gz"
      sha256 "25de67945fac1aeb5ab74fb824ced8682a4cc61a4cd72128d8a013fbc2bc4424"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.9.1/prova-v0.9.1-linux-arm64.tar.gz"
      sha256 "179fbd7581cda0ced5057462bb8453f27971f52eea225839ac71d743f6118b17"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.9.1/prova-v0.9.1-macos-arm64.tar.gz"
      sha256 "9103df56673b21161e1b32147788d937dbbe2c969b62041ecdfa91eb035f03e2"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
