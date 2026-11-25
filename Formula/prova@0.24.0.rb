class ProvaAT0240 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.24.0"

  # Platform choice uses on_arm/on_intel, never `if Hardware::CPU.arm?`: Homebrew loads every
  # formula once per OS/arch it supports (brew readall), and only the on_* blocks follow that
  # simulation. Hardware::CPU reports the machine actually running, so the old `if` blocks left
  # every simulated target without a URL and readall rejected the whole tap.
  on_macos do
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.24.0/prova-v0.24.0-macos-arm64.tar.gz"
      sha256 "eee6516c245a74ad9a449cfb93ddf57dc7779adb4a791a67c9f6a65229c39f07"
    end
    on_intel do
      # No Intel macOS build ships. The arm64 archive keeps the formula loadable on every
      # target; the arch requirement refuses the install instead of handing over that binary.
      url "https://github.com/prova-rs/prova/releases/download/v0.24.0/prova-v0.24.0-macos-arm64.tar.gz"
      sha256 "eee6516c245a74ad9a449cfb93ddf57dc7779adb4a791a67c9f6a65229c39f07"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/prova-rs/prova/releases/download/v0.24.0/prova-v0.24.0-linux-x86_64.tar.gz"
      sha256 "a194ed4f64d2cb9b78257037e5f279d85512602ce7769c88aa269b2c1c88aebc"
    end
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.24.0/prova-v0.24.0-linux-arm64.tar.gz"
      sha256 "8c3e4095c4c37679fac7acecacdfe4f7cb4634d396fed10692260b835df35fc2"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system bin/"prova", "--version"
  end
end
