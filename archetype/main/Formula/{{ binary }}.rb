class {{ class_name }} < Formula
  desc "{{ description }}"
  homepage "{{ homepage }}"
  version "{{ version }}"{% if builds["linux-x86_64_archive"] or builds["linux-arm64_archive"] %}

  on_linux do
    {% if builds["linux-x86_64_archive"] %}if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "{{ builds["linux-x86_64_archive"] }}"
      sha256 "{{ builds["linux-x86_64_sha256"] }}"
    end{% endif %}{% if builds["linux-arm64_archive"] %}
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "{{ builds["linux-arm64_archive"] }}"
      sha256 "{{ builds["linux-arm64_sha256"] }}"
    end{% endif %}
  end{% endif %}{% if builds["macos-x86_64_archive"] or builds["macos-arm64_archive"] %}

  on_macos do{% if builds["macos-x86_64_archive"] %}
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "{{ builds["macos-x86_64_archive"] }}"
      sha256 "{{ builds["macos-x86_64_sha256"] }}"
    end{% endif %}{% if builds["macos-arm64_archive"] %}
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "{{ builds["macos-arm64_archive"] }}"
      sha256 "{{ builds["macos-arm64_sha256"] }}"
    end{% endif %}
  end{% endif %}

  def install
    bin.install "{{ binary }}"
  end

  test do
    system "#{bin}/{{ binary }} --version"
  end

end
