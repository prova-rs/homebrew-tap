class ProvaAT0230 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.23.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.23.0/prova-v0.23.0-linux-x86_64.tar.gz"
      sha256 "f3de8df1a5e4775fd22dbc0fc9c61e548baf896963d80ffe3346d94198b9b325"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.23.0/prova-v0.23.0-linux-arm64.tar.gz"
      sha256 "8c0c50b5ff48dec8224fb9dc650b4aba3bfbece871a7153a9d99b5b8fc3efec1"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.23.0/prova-v0.23.0-macos-arm64.tar.gz"
      sha256 "0d2e557e4034ed9efb2dfcf81b240d90dbfbc472cb0c785fd68d12c3395a246a"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
