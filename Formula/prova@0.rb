class ProvaAT0 < Formula
  desc "Prova"
  homepage "https://github.com/prova-rs/prova"
  version "0.30.13"

  # Platform choice uses on_arm/on_intel, never `if Hardware::CPU.arm?`: Homebrew loads every
  # formula once per OS/arch it supports (brew readall), and only the on_* blocks follow that
  # simulation. Hardware::CPU reports the machine actually running, so the old `if` blocks left
  # every simulated target without a URL and readall rejected the whole tap.
  on_macos do
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.30.13/prova-v0.30.13-macos-arm64.tar.gz"
      sha256 "4c5f57cbffa737c08a01d70735bfe833557cf8f1d1ed57786bba765370d06d84"
    end
    on_intel do
      # No Intel macOS build ships. The arm64 archive keeps the formula loadable on every
      # target; the arch requirement refuses the install instead of handing over that binary.
      url "https://github.com/prova-rs/prova/releases/download/v0.30.13/prova-v0.30.13-macos-arm64.tar.gz"
      sha256 "4c5f57cbffa737c08a01d70735bfe833557cf8f1d1ed57786bba765370d06d84"
      depends_on arch: :arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/prova-rs/prova/releases/download/v0.30.13/prova-v0.30.13-linux-x86_64.tar.gz"
      sha256 "25c6914524aee03409d316c81af993ea6f0af21dce9df2c31e93e8562a826d86"
    end
    on_arm do
      url "https://github.com/prova-rs/prova/releases/download/v0.30.13/prova-v0.30.13-linux-arm64.tar.gz"
      sha256 "ce6ee21f2b4af19bbe125b93df32a95e9b07c9b3324e7b8006c2f77b70bb7039"
    end
  end

  def install
    bin.install "prova"
  end

  test do
    system bin/"prova", "--version"
  end
end
