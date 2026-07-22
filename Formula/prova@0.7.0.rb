class ProvaAT0_7_0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.7.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.7.0/prova-v0.7.0-linux-x86_64.tar.gz"
      sha256 "ac7f04707a4395f3f91b624edb03d55acd267e9f69cb3a3a5d4ad99999ef431a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.7.0/prova-v0.7.0-linux-arm64.tar.gz"
      sha256 "53f8a51b75f90d3c61c0cdc9f5ecfba23e3050a8d7c52c5ea8b3a0625093b84c"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.7.0/prova-v0.7.0-macos-arm64.tar.gz"
      sha256 "30a70443f08b6a2c325d9b916d6efe9169d7d5daa1a82dca45dd6a270c51e824"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
