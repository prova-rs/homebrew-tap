class Prova < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.26.1"

  # Platform choice uses on_arm/on_intel, never `if Hardware::CPU.arm?`: Homebrew loads every
  # formula once per OS/arch it supports (brew readall), and only the on_* blocks follow that
  # simulation. Hardware::CPU reports the machine actually running, so the old `if` blocks left
  # every simulated target without a URL and readall rejected the whole tap.
  on_macos do
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.26.1/prova-v0.26.1-macos-arm64.tar.gz"
      sha256 "bf2b3ca1ee73177c3fc20fd7258884c8a4b45227014f5472b75b1104390eb899"
    end
    on_intel do
      # No Intel macOS build ships. The arm64 archive keeps the formula loadable on every
      # target; the arch requirement refuses the install instead of handing over that binary.
      url "https://github.com/prova-rs/prova/releases/download/v0.26.1/prova-v0.26.1-macos-arm64.tar.gz"
      sha256 "bf2b3ca1ee73177c3fc20fd7258884c8a4b45227014f5472b75b1104390eb899"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/prova-rs/prova/releases/download/v0.26.1/prova-v0.26.1-linux-x86_64.tar.gz"
      sha256 "a6efb7bccfd3894db82b01ce2f513b664f6654a5556a81945ac4bc0877adf673"
    end
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.26.1/prova-v0.26.1-linux-arm64.tar.gz"
      sha256 "dc73189e0d257445e19075a89fbd7cac0da58c61accde9c9d3457bc38586168d"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system bin/"prova", "--version"
  end
end
