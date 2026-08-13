class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.22.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.22.0/prova-v0.22.0-linux-x86_64.tar.gz"
      sha256 "062050a8d830cc0e0aff84c569a562d85561ad6bffe543eeeec6ecb1e5f0b41f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.22.0/prova-v0.22.0-linux-arm64.tar.gz"
      sha256 "2ca8c906d2acfa06530640699f758e5ea9b4448629772ba5a5570e0f13ca8416"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.22.0/prova-v0.22.0-macos-arm64.tar.gz"
      sha256 "aa8af96fd0348e1ae1a9f9f94129ec601c3351ef04dacbf2b9eda566464e781e"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
