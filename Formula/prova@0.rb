class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.8.1"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.8.1/prova-v0.8.1-linux-x86_64.tar.gz"
      sha256 "99139e73b5d1ecbb1090458b4779ea30a818d0120b19e0655fb32f146d133ed3"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.8.1/prova-v0.8.1-linux-arm64.tar.gz"
      sha256 "bb62619f97c9c08ba8f43cf12714be75f4f126ca917341498095469949fa5b9b"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.8.1/prova-v0.8.1-macos-arm64.tar.gz"
      sha256 "8429e5f3796991ec84b0acf1b7ddc551eeeb2806b6bcab1aff69339af08081b1"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
