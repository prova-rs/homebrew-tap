class ProvaAT0230 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.23.0"

  # Platform choice uses on_arm/on_intel, never `if Hardware::CPU.arm?`: Homebrew loads every
  # formula once per OS/arch it supports (brew readall), and only the on_* blocks follow that
  # simulation. Hardware::CPU reports the machine actually running, so the old `if` blocks left
  # every simulated target without a URL and readall rejected the whole tap.
  on_macos do
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.23.0/prova-v0.23.0-macos-arm64.tar.gz"
      sha256 "0d2e557e4034ed9efb2dfcf81b240d90dbfbc472cb0c785fd68d12c3395a246a"
    end
    on_intel do
      # No Intel macOS build ships. The arm64 archive keeps the formula loadable on every
      # target; the arch requirement refuses the install instead of handing over that binary.
      url "https://github.com/prova-rs/prova/releases/download/v0.23.0/prova-v0.23.0-macos-arm64.tar.gz"
      sha256 "0d2e557e4034ed9efb2dfcf81b240d90dbfbc472cb0c785fd68d12c3395a246a"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/prova-rs/prova/releases/download/v0.23.0/prova-v0.23.0-linux-x86_64.tar.gz"
      sha256 "f3de8df1a5e4775fd22dbc0fc9c61e548baf896963d80ffe3346d94198b9b325"
    end
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.23.0/prova-v0.23.0-linux-arm64.tar.gz"
      sha256 "8c0c50b5ff48dec8224fb9dc650b4aba3bfbece871a7153a9d99b5b8fc3efec1"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system bin/"prova", "--version"
  end
end
