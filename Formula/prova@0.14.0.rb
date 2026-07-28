class ProvaAT0_14_0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.14.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.14.0/prova-v0.14.0-linux-x86_64.tar.gz"
      sha256 "69243b25a32eee4c17108b51ca83f8f69f42b9e7c5fc2e595b154cf75daf655d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.14.0/prova-v0.14.0-linux-arm64.tar.gz"
      sha256 "9d9ef917450eead5292cf6e2de839656f6707f7559c5762a3247d5fe0bbabc5c"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.14.0/prova-v0.14.0-macos-arm64.tar.gz"
      sha256 "a3406a426788aae1349035b82a0f2b06f9b991ec47c392daff86696ec7476144"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
