class ProvaAT0250 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.25.0"

  # Platform choice uses on_arm/on_intel, never `if Hardware::CPU.arm?`: Homebrew loads every
  # formula once per OS/arch it supports (brew readall), and only the on_* blocks follow that
  # simulation. Hardware::CPU reports the machine actually running, so the old `if` blocks left
  # every simulated target without a URL and readall rejected the whole tap.
  on_macos do
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.25.0/prova-v0.25.0-macos-arm64.tar.gz"
      sha256 "d7fd06c739f9f80fd883f43367fe4cfd38da2b0bcfa8989a5ea78e95c39bb0ea"
    end
    on_intel do
      # No Intel macOS build ships. The arm64 archive keeps the formula loadable on every
      # target; the arch requirement refuses the install instead of handing over that binary.
      url "https://github.com/prova-rs/prova/releases/download/v0.25.0/prova-v0.25.0-macos-arm64.tar.gz"
      sha256 "d7fd06c739f9f80fd883f43367fe4cfd38da2b0bcfa8989a5ea78e95c39bb0ea"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/prova-rs/prova/releases/download/v0.25.0/prova-v0.25.0-linux-x86_64.tar.gz"
      sha256 "b44ca69c7edc8c3fcee581ef15e784bb6d9ff0b7f2ebcc3c6371afa5f0512250"
    end
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.25.0/prova-v0.25.0-linux-arm64.tar.gz"
      sha256 "f1e0e225966ff063522a8ba7ec1a15cb164c7705b436873a2785c93c4271b582"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system bin/"prova", "--version"
  end
end
