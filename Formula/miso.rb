class Miso < Formula
  desc "The agnostic package manager"
  homepage "https://github.com/ekkolyth/miso"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_darwin_arm64.tar.gz"
      sha256 "98792a9477435d758dec59c21799903e2bd286628f5359293b7a4a34a269032d"
    end

    on_intel do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_darwin_amd64.tar.gz"
      sha256 "0e66dd0b0f272fc672b5c5591be8da7ef24c066f57bad9dfcdc215c09fade9b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_linux_arm64.tar.gz"
      sha256 "230467d286e8111cf0c9aeddaeec8618aaee2e3bc89edd545eca26a7f4f5c727"
    end

    on_intel do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_linux_amd64.tar.gz"
      sha256 "ce391657455afcf86a3325165804e02cad1eb2895150a7265137292f428998d4"
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
