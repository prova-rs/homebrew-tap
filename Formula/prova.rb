class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.26.1"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.26.1/prova-v0.26.1-linux-x86_64.tar.gz"
      sha256 "a6efb7bccfd3894db82b01ce2f513b664f6654a5556a81945ac4bc0877adf673"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.26.1/prova-v0.26.1-linux-arm64.tar.gz"
      sha256 "dc73189e0d257445e19075a89fbd7cac0da58c61accde9c9d3457bc38586168d"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.26.1/prova-v0.26.1-macos-arm64.tar.gz"
      sha256 "bf2b3ca1ee73177c3fc20fd7258884c8a4b45227014f5472b75b1104390eb899"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
