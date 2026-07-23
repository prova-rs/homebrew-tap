class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.10.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.10.0/prova-v0.10.0-linux-x86_64.tar.gz"
      sha256 "5c65bbd36cf12f1ac832a8599d0b914a57cb74c0cb31ae2901b864c057cac605"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.10.0/prova-v0.10.0-linux-arm64.tar.gz"
      sha256 "bc26e9a162affca41dc122278e8f8587fa007cda2196c7688e672e526e0c85f8"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.10.0/prova-v0.10.0-macos-arm64.tar.gz"
      sha256 "03c9a0d8ef8087a8fb85e6401f0af858e800183f3b40403a0329aee82e99c968"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
