class ProvaAT0260 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.26.0"

  # Platform choice uses on_arm/on_intel, never `if Hardware::CPU.arm?`: Homebrew loads every
  # formula once per OS/arch it supports (brew readall), and only the on_* blocks follow that
  # simulation. Hardware::CPU reports the machine actually running, so the old `if` blocks left
  # every simulated target without a URL and readall rejected the whole tap.
  on_macos do
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.26.0/prova-v0.26.0-macos-arm64.tar.gz"
      sha256 "523077b8b454761d08918628f1d0608ceeb41f3e98838826a499c1ddd0e29ff3"
    end
    on_intel do
      # No Intel macOS build ships. The arm64 archive keeps the formula loadable on every
      # target; the arch requirement refuses the install instead of handing over that binary.
      url "https://github.com/prova-rs/prova/releases/download/v0.26.0/prova-v0.26.0-macos-arm64.tar.gz"
      sha256 "523077b8b454761d08918628f1d0608ceeb41f3e98838826a499c1ddd0e29ff3"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/prova-rs/prova/releases/download/v0.26.0/prova-v0.26.0-linux-x86_64.tar.gz"
      sha256 "b60f9d33451f9c379b40cd91528dc663f93d64b490b857c07a5fb67d27141ba3"
    end
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.26.0/prova-v0.26.0-linux-arm64.tar.gz"
      sha256 "5bd9a97a47001ee29d43ba4598ea40abd763f54115d63a9a09092bd4ac85170e"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system bin/"prova", "--version"
  end
end
