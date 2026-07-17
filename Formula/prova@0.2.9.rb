class ProvaAT0_2_9 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.2.9"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.9/prova-v0.2.9-linux-x86_64.tar.gz"
      sha256 "6a1bb521c91ffafb89012b718dc443c4a2b914f7479fe342f23d46edb16d1b33"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.9/prova-v0.2.9-linux-arm64.tar.gz"
      sha256 "77177c5ab706d57ca94716178d3ff79ac6c9ba1294aaad2a472c0cf45dd1c145"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.9/prova-v0.2.9-macos-arm64.tar.gz"
      sha256 "77b6f5958fcf147e69d1036e22339df69fe1107282f5145460f23d1a5a78aa46"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
