class ProvaAT0_2_10 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.2.10"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.10/prova-v0.2.10-linux-x86_64.tar.gz"
      sha256 "decc6c1a4ae6dc33289f9a4d79825644f3eca6ae69d0669329439a5d9c0ca632"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.10/prova-v0.2.10-linux-arm64.tar.gz"
      sha256 "46497c978c4c39524448f9ac45162aa4f10ab99a1987a8128b003c243230fa1e"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.10/prova-v0.2.10-macos-arm64.tar.gz"
      sha256 "a5f99109820595bbfc941cc18202b3227ea56b416006ed906cc1812d6d4aa7a9"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
