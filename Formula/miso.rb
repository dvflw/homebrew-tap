class Miso < Formula
  desc "The agnostic package manager"
  homepage "https://github.com/ekkolyth/miso"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_darwin_arm64.tar.gz"
      sha256 "b0938961d9ace126c5693894a29de9c6b78cc01c47e7217e24848a303779de91"
    end

    on_intel do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_darwin_amd64.tar.gz"
      sha256 "260019e2acbc5001931b72672ba87fee3674eab3ad360837994b6417a728bffd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_linux_arm64.tar.gz"
      sha256 "759de51cb0d05045578eec887248aa49a54e75c201a2385137af49e6f65bc61a"
    end

    on_intel do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_linux_amd64.tar.gz"
      sha256 "226fc09a09c19e3a2dcdd50464390d73a1c76ce3653b12cafc73d2dc5b5a9d6d"
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
