class ProvaAT0_4_0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.4.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.4.0/prova-v0.4.0-linux-x86_64.tar.gz"
      sha256 "6b86bf812bd5e1f3d7336f456e9e0b10e5ea9e5a08582637fb1012b61def90da"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.4.0/prova-v0.4.0-linux-arm64.tar.gz"
      sha256 "cc4c8b21b021f2e75bfc2224746e50882450a6eba6241c7f379057ad5994fcef"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.4.0/prova-v0.4.0-macos-arm64.tar.gz"
      sha256 "32ce59c940d05e5fbc6ae951422e402e05b52ae04666822d1377a410943f39af"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
