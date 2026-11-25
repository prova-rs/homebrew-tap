class {{ class_name }}AT{{ major }} < Formula
  desc "{{ description }}"
  homepage "{{ homepage }}"
  version "{{ version }}"
{% if builds["macos-arm64_archive"] or builds["macos-x86_64_archive"] %}
  # Platform choice uses on_arm/on_intel, never `if Hardware::CPU.arm?`: Homebrew loads every
  # formula once per OS/arch it supports (brew readall), and only the on_* blocks follow that
  # simulation. Hardware::CPU reports the machine actually running, so the old `if` blocks left
  # every simulated target without a URL and readall rejected the whole tap.
  on_macos do{% if builds["macos-arm64_archive"] %}
    on_arm do
      url "{{ builds["macos-arm64_archive"] }}"
      sha256 "{{ builds["macos-arm64_sha256"] }}"
    end{% endif %}
    on_intel do{% if builds["macos-x86_64_archive"] %}
      url "{{ builds["macos-x86_64_archive"] }}"
      sha256 "{{ builds["macos-x86_64_sha256"] }}"{% else %}
      # No Intel macOS build ships. The arm64 archive keeps the formula loadable on every
      # target; the arch requirement refuses the install instead of handing over that binary.
      url "{{ builds["macos-arm64_archive"] }}"
      sha256 "{{ builds["macos-arm64_sha256"] }}"
      depends_on arch: :arm64{% endif %}
    end
  end
{% endif %}{% if builds["linux-x86_64_archive"] or builds["linux-arm64_archive"] %}
  on_linux do{% if builds["linux-x86_64_archive"] %}
    on_intel do
      url "{{ builds["linux-x86_64_archive"] }}"
      sha256 "{{ builds["linux-x86_64_sha256"] }}"
    end{% endif %}{% if builds["linux-arm64_archive"] %}
    on_arm do
      url "{{ builds["linux-arm64_archive"] }}"
      sha256 "{{ builds["linux-arm64_sha256"] }}"
    end{% endif %}
  end
{% endif %}
  def install
    bin.install "{{ binary }}"
  end

  test do
    system bin/"{{ binary }}", "--version"
  end
end
