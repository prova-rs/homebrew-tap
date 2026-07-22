class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.8.2"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.8.2/prova-v0.8.2-linux-x86_64.tar.gz"
      sha256 "a667d4c71b4116f7074f7a1c6aa44fb6885f9f37eca22644a8dd04e82f9abe93"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.8.2/prova-v0.8.2-linux-arm64.tar.gz"
      sha256 "5923f3f404b7c1ceff416b8ed6cbe12c1429f2af2104c7efb021ede7f53e519f"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.8.2/prova-v0.8.2-macos-arm64.tar.gz"
      sha256 "2000a6fdb28ff20ad094c959c0ab86d074ba9a28ea5d32b6032bd94836435561"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
