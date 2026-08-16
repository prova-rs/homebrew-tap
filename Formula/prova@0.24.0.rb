class ProvaAT0_24_0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.24.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.24.0/prova-v0.24.0-linux-x86_64.tar.gz"
      sha256 "a194ed4f64d2cb9b78257037e5f279d85512602ce7769c88aa269b2c1c88aebc"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.24.0/prova-v0.24.0-linux-arm64.tar.gz"
      sha256 "8c3e4095c4c37679fac7acecacdfe4f7cb4634d396fed10692260b835df35fc2"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.24.0/prova-v0.24.0-macos-arm64.tar.gz"
      sha256 "eee6516c245a74ad9a449cfb93ddf57dc7779adb4a791a67c9f6a65229c39f07"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
