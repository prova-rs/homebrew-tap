class ProvaAT0_2_5 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.2.5"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.5/prova-v0.2.5-linux-x86_64.tar.gz"
      sha256 "98ec3bb60c8eea10c3a35994e4a2dd88562af34ccabca58da8400eab2fd675ec"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.5/prova-v0.2.5-linux-arm64.tar.gz"
      sha256 "90888259d3442139a7d6dd3216859a27df062a6ce13b3212001942d92dac1271"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.5/prova-v0.2.5-macos-arm64.tar.gz"
      sha256 "17d421dfa0d3a510a473a3da1bcf99435a6facbf6688d3442d23dff7d73b63b9"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
