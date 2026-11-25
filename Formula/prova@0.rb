class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.30.14"

  # Platform choice uses on_arm/on_intel, never `if Hardware::CPU.arm?`: Homebrew loads every
  # formula once per OS/arch it supports (brew readall), and only the on_* blocks follow that
  # simulation. Hardware::CPU reports the machine actually running, so the old `if` blocks left
  # every simulated target without a URL and readall rejected the whole tap.
  on_macos do
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.30.14/prova-v0.30.14-macos-arm64.tar.gz"
      sha256 "8c11fea4aa85dcafdc23b4ac9eb168ddb8ee9e7b162a1c853e0472a3dd0bf904"
    end
    on_intel do
      # No Intel macOS build ships. The arm64 archive keeps the formula loadable on every
      # target; the arch requirement refuses the install instead of handing over that binary.
      url "https://github.com/prova-rs/prova/releases/download/v0.30.14/prova-v0.30.14-macos-arm64.tar.gz"
      sha256 "8c11fea4aa85dcafdc23b4ac9eb168ddb8ee9e7b162a1c853e0472a3dd0bf904"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/prova-rs/prova/releases/download/v0.30.14/prova-v0.30.14-linux-x86_64.tar.gz"
      sha256 "cdde9cf89ad731d95efcdd58d553e3ce242b629bb1233a9862af603fd7649507"
    end
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.30.14/prova-v0.30.14-linux-arm64.tar.gz"
      sha256 "5bd365df73a941347b4e42935d63890754f075deacd23b9826a0b23a71b41da0"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system bin/"prova", "--version"
  end
end
