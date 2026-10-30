class Miso < Formula
  desc "The agnostic package manager"
  homepage "https://github.com/ekkolyth/miso"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_darwin_arm64.tar.gz"
      sha256 "5f8f3b8de5598dbf627e4564c08380e5fbccb4cf8556956d7f77569ceb95eafa"
    end

    on_intel do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_darwin_amd64.tar.gz"
      sha256 "0775d0ec6b826415b8a635b1faa01b574d5aed79b69f8186de71489f1169795c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_linux_arm64.tar.gz"
      sha256 "36537b4d64176a336331275d5e18d94380f3b95ac9fb537500d653a419a9dcdd"
    end

    on_intel do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_linux_amd64.tar.gz"
      sha256 "6fa387b5131d3e68f89d0e043326135d493808c8a29e1edac743261b1a6cd6b1"
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
