class ProvaAT0_21_0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.21.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.21.0/prova-v0.21.0-linux-x86_64.tar.gz"
      sha256 "68343a3c0f0eb29bab9e6aec83db62f0505f8315f86fb3c1e6a30e0921c60158"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.21.0/prova-v0.21.0-linux-arm64.tar.gz"
      sha256 "75a8d8b9f04d08ad086b7c83f0b3b050518c10575e254cd8a067ae57c64d470b"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.21.0/prova-v0.21.0-macos-arm64.tar.gz"
      sha256 "b8f85ef5509275878bd650f82ac41c8f2b7160b55751a037c7aeb4a60ae140c3"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
