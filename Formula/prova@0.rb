class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.2.2"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.2/prova-v0.2.2-linux-x86_64.tar.gz"
      sha256 "6829f3ccd12a655876c69f78f0bf55d774ea378bb3ade5d6e5855c7efe7e7655"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.2/prova-v0.2.2-linux-arm64.tar.gz"
      sha256 "bf4597a028851823b2fb9ef1a5622c4afeb1f40e2046f5ca3fd42a7db16c6471"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.2.2/prova-v0.2.2-macos-arm64.tar.gz"
      sha256 "e2031d8a65fea0e50adb36e32bedc6c262d53003ab5d41ce45088a9e7d2b5700"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
