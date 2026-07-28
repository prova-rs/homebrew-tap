class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.15.0"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.15.0/prova-v0.15.0-linux-x86_64.tar.gz"
      sha256 "8a24222741bcad7bac89fb69259699d1352ac3515fe6648c68b625303fc98ff3"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.15.0/prova-v0.15.0-linux-arm64.tar.gz"
      sha256 "a329fcd2a11a165e94eaccce8f2caf4e02e503e753942e6c07bc27d52040b733"
    end
  end

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/prova-rs/prova/releases/download/v0.15.0/prova-v0.15.0-macos-arm64.tar.gz"
      sha256 "0f1c5ca97650fb86b65be7ec0851ec2b5804e3d752febb577ccb08d7a628b016"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system "#{bin}/prova --version"
  end

end
