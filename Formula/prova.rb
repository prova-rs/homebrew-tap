class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.2.7"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.7/prova-v0.2.7-linux-x86_64.tar.gz"
      sha256 "68a66fb00380d5bfdef0f41e3c0e00660f4d4906dcfb499b55cdfb9cf52aaeb6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.7/prova-v0.2.7-linux-arm64.tar.gz"
      sha256 "f57eb751939a02bffb6d519158ab099a5e4d3c86a4e63a5f9df09032dd9c7249"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.7/prova-v0.2.7-macos-arm64.tar.gz"
      sha256 "0ca2a4fd93babcb3fc965ff94310570a8d01615413975514e4afce31e9364fc0"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
