class Miso < Formula
  desc "The agnostic package manager"
  homepage "https://github.com/ekkolyth/miso"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_darwin_arm64.tar.gz"
      sha256 "cc30f2a21d72b80a10b7831407afb5ea25810e2a238091fba0c632a68c99efed"
    end

    on_intel do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_darwin_amd64.tar.gz"
      sha256 "bb1ede092aa30835c899ba947f9c8ef1b33d23e3ba620e031f1ed18a0f5a3f8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_linux_arm64.tar.gz"
      sha256 "8619b76ae235ec07740fc018ab45044b1b7ae81eb5605d0f9f368b2873ba41b2"
    end

    on_intel do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_linux_amd64.tar.gz"
      sha256 "d139eceeb858578ec69aeda5dd9d123c6647f3412fb5217c40df8421f2b3095b"
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
