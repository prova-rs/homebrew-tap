class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.1.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.1.0/prova-v0.1.0-linux-x86_64.tar.gz"
      sha256 "960bd2a88f8c622993f18c8b401b2ba09a0018501f356c3a2c1e95b764cb6da2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.1.0/prova-v0.1.0-linux-arm64.tar.gz"
      sha256 "64a79cd6d177775ae849fafe93b759b798090b396a86441fc8ccfc736d15a773"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.1.0/prova-v0.1.0-macos-arm64.tar.gz"
      sha256 "21c4225bce5c3e94814a5e44d6a96c8f72896c543f396c754c3c31ffa090d885"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
