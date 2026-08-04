class ProvaAT0_17_0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.17.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.17.0/prova-v0.17.0-linux-x86_64.tar.gz"
      sha256 "a61fd4a3213617ba465397c1fcfe872fa09af9fe2425e3587784186bd2085fd7"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.17.0/prova-v0.17.0-linux-arm64.tar.gz"
      sha256 "6baedb88ba975e2c45c2a17d27e782c766107857b0880169af9b8acbbb72b60a"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.17.0/prova-v0.17.0-macos-arm64.tar.gz"
      sha256 "cf57fa535d7fc2813aee606f5cde8df298fd362a4c10816858eb7d640ff22fb2"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
