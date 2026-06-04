class Mantle < Formula
  desc "Headless AI workflow automation platform — BYOK, IaC-first, self-hosted"
  homepage "https://github.com/dvflw/mantle"
  version "0.5.1"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/dvflw/mantle/releases/download/v#{version}/mantle-darwin-arm64.tar.gz"
      sha256 "ba2dd82b63eb06f56eb0ecfd45deb94a487f1e0153493f898101f19e2a76ee77"
    end

    on_intel do
      url "https://github.com/dvflw/mantle/releases/download/v#{version}/mantle-darwin-amd64.tar.gz"
      sha256 "1c6aff482674f746ad177f7d4fb461d1f13cb8516ae3ca5b67aabf1d255e47dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dvflw/mantle/releases/download/v#{version}/mantle-linux-arm64.tar.gz"
      sha256 "b79cf7abefcc440a330d1ee1c949110f16af3f40cd37907ec9981f98a434840f"
    end

    on_intel do
      url "https://github.com/dvflw/mantle/releases/download/v#{version}/mantle-linux-amd64.tar.gz"
      sha256 "0d5e7346c46bcf56bde14f37dc907c6f72e1c9202edca2989d8e3f2dc73793b6"
    end
  end

  def install
    bin.install "mantle"
  end

  test do
    system "#{bin}/mantle", "version"
  end
end
