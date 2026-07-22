class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.6.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.6.0/prova-v0.6.0-linux-x86_64.tar.gz"
      sha256 "9c74c5ed039193b41bf8323cd9769a207b9a7c7c94be0324757ad5924585d5c9"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.6.0/prova-v0.6.0-linux-arm64.tar.gz"
      sha256 "00cd650537a974f35769af0bb3c4755e1d9dc07dc12e5406aa5941a07c8c215e"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.6.0/prova-v0.6.0-macos-arm64.tar.gz"
      sha256 "781f1727fb43b728588ea7720ec7a490d42c0a9238c0f254064643c476922a63"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
