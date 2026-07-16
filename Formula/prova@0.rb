class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.2.3"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.3/prova-v0.2.3-linux-x86_64.tar.gz"
      sha256 "83624f544fdaf68022dcaad628a8c2f15786b7720f09bebab1f6dff6dbaa58a8"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.3/prova-v0.2.3-linux-arm64.tar.gz"
      sha256 "e9ac6b32c61614d40571d216a1307bc820cbb8e0456d30aafc23f90cb901a98e"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.3/prova-v0.2.3-macos-arm64.tar.gz"
      sha256 "20e94ef363fba5279c6b69a496de622b7c1a47200f155eed8462dd0f33bb5d71"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
