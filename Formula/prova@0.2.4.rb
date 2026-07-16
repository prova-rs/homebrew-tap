class ProvaAT0_2_4 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.2.4"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.4/prova-v0.2.4-linux-x86_64.tar.gz"
      sha256 "daa15823135fba5f0adcca11f84ef4e037555e73441edf7ea1b92c5bdd5e36f0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.4/prova-v0.2.4-linux-arm64.tar.gz"
      sha256 "922a8b668b4fdd929270017d823117230e318417afc9dc1cf280733ff9ee39fb"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.4/prova-v0.2.4-macos-arm64.tar.gz"
      sha256 "fa7f361368986263e3ef6a95087b5ad58a7f0f1b0ea53b670ba4d60feb07ba12"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
