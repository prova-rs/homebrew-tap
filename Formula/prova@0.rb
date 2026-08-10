class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.19.1"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.19.1/prova-v0.19.1-linux-x86_64.tar.gz"
      sha256 "fff4b44ab677b1a7452d4964c6136b33ba145095618cd1198031152112a98e9a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.19.1/prova-v0.19.1-linux-arm64.tar.gz"
      sha256 "3ffa90e9630dad774094c473b4c675b4936fa9882a95cb1d1bd1377711d0ff82"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.19.1/prova-v0.19.1-macos-arm64.tar.gz"
      sha256 "c9c995da5e2f5561867a920786e36a44080da5a423b71b4096695ffc70754759"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
