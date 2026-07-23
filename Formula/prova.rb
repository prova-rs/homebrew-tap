class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.9.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.9.0/prova-v0.9.0-linux-x86_64.tar.gz"
      sha256 "af9e8f0bc3a8a7f2a4fe871960ae7127a1727ceb27957c834c6043444d5cda6d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.9.0/prova-v0.9.0-linux-arm64.tar.gz"
      sha256 "da67e76809769248371177b3785bc8e183e1c248f722bc1479debf2d1f9f8933"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.9.0/prova-v0.9.0-macos-arm64.tar.gz"
      sha256 "6363d8325171c137549631146c68cfd65894306315638358076dcfefd15b8c29"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
