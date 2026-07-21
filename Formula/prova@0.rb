class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.3.1"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.3.1/prova-v0.3.1-linux-x86_64.tar.gz"
      sha256 "d8df191658d397add6db69a2e9b44744037148dd9702e398a05dbf7f4a1005a4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.3.1/prova-v0.3.1-linux-arm64.tar.gz"
      sha256 "b3b7181f0bf70cc5b1b23b39b82ba50418842f35f9c22ac5c2476c9def01c489"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.3.1/prova-v0.3.1-macos-arm64.tar.gz"
      sha256 "2256de1ca71a47b7c46eaa32673f9cffc62abb2a1738a2f9348dc66563be56d9"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
