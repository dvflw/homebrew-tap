class Miso < Formula
  desc "The agnostic package manager"
  homepage "https://github.com/ekkolyth/miso"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_darwin_arm64.tar.gz"
      sha256 "6d92cbd7eb2190d3dc14ebafeb9ac3b6ae8e8544287aaf7fff0d073da539527b"
    end

    on_intel do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_darwin_amd64.tar.gz"
      sha256 "7cad39c874b98010ee74142eb69545cef9f9e7437823b8eb84dc944a66fa41cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_linux_arm64.tar.gz"
      sha256 "25b6021d0802a248c20d2a8c1aa3cdf87b39cc3cb28dc24bcbc6f69a1ff6d1b0"
    end

    on_intel do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_linux_amd64.tar.gz"
      sha256 "26a9fb328a8f1125595c215765acd0195bcee99934b00b376d071948e3b48568"
    end
  end

  def install
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"

    bin.install "miso-#{os}-#{arch}" => "miso"
    bin.install "misox-#{os}-#{arch}" => "misox"
  end

  test do
    system "#{bin}/miso", "version"
  end
end
