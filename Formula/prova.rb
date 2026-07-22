class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.8.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.8.0/prova-v0.8.0-linux-x86_64.tar.gz"
      sha256 "598ae4bdc7cafd8f7e9b9e605e3f7df5f1a0324a9279fe90dba3dabbb9aac36a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.8.0/prova-v0.8.0-linux-arm64.tar.gz"
      sha256 "eed21ef49fb3040654c732c3d7512b6f339593b20d95c346ff06d9ece118506f"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.8.0/prova-v0.8.0-macos-arm64.tar.gz"
      sha256 "0f998ea6b172cf612b7dd770b4d6088f54952a3809a7aacadda68319cf6c7c40"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
