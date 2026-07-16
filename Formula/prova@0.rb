class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.2.6"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.6/prova-v0.2.6-linux-x86_64.tar.gz"
      sha256 "d0045bb9013471a506e2e2ecfd5c7c6ba2fce6427429336a03f35b74e32f1879"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.6/prova-v0.2.6-linux-arm64.tar.gz"
      sha256 "f02f91498503ec438fb2c63c7a08ba031771cd6d1fc2f80f14c822d87ac57e87"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.6/prova-v0.2.6-macos-arm64.tar.gz"
      sha256 "bfecd2450bb7519472cbcfd51f9011ef89f11cf126e645b255e0885d1a051bd9"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
