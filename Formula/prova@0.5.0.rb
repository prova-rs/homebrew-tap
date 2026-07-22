class ProvaAT0_5_0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.5.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.5.0/prova-v0.5.0-linux-x86_64.tar.gz"
      sha256 "6159425a6c840880e0d0395b100d3bb31c85da20fb0ceb6ad7ccbf17ea74fd12"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.5.0/prova-v0.5.0-linux-arm64.tar.gz"
      sha256 "3ef9b339e07f433b3e0b30060bf2867a3b31ce1035faac08b267b4b5f2e2b544"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.5.0/prova-v0.5.0-macos-arm64.tar.gz"
      sha256 "582d0c4130a7357a573ea00b630bbdc20e7c85171b6d6b35be5648a5bcb75b78"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
