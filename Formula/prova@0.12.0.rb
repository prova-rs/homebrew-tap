class ProvaAT0_12_0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.12.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.12.0/prova-v0.12.0-linux-x86_64.tar.gz"
      sha256 "999f5abad1c8d31a88a9fb667f854464489822d6f624f47951b6d9e808650220"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.12.0/prova-v0.12.0-linux-arm64.tar.gz"
      sha256 "16f3840fc02f17c47643100c22cd0a7bc7e7fe67e709c195084054a5c75a9d07"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.12.0/prova-v0.12.0-macos-arm64.tar.gz"
      sha256 "0a3fb3f8d98c1c4af560f6d01ae805ff074382ac28ff9d54468959c9e32718d1"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
