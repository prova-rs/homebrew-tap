class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.11.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.11.0/prova-v0.11.0-linux-x86_64.tar.gz"
      sha256 "8b77f644c69a7cd0eecc1bb52cb56c31d0601c36a2b12b5215235c84693af249"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.11.0/prova-v0.11.0-linux-arm64.tar.gz"
      sha256 "3240c083349e2f6b413f17da7e77bbd1774f382432f25ec843e0de8fc570d4ce"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.11.0/prova-v0.11.0-macos-arm64.tar.gz"
      sha256 "54928f21d2672e30badbd492ea14f494f7a58dc43e5244b04bb64577129b4d3a"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
