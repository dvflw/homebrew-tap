class Miso < Formula
  desc "The agnostic package manager"
  homepage "https://github.com/ekkolyth/miso"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_darwin_arm64.tar.gz"
      sha256 "3b11bccad07e6a896252c745e1f92d8e1baaf2c349ffcdbe50fd8807ce94e203"
    end

    on_intel do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_darwin_amd64.tar.gz"
      sha256 "e92191799fae96e371d0d013fc2bbb1be7121a1882044511ccad22cabf2b7c66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_linux_arm64.tar.gz"
      sha256 "2169b1f921e8b595a65521e3e768e845245b37a226280b05548e8112b0f6f9af"
    end

    on_intel do
      url "https://github.com/ekkolyth/miso/releases/download/v#{version}/miso_#{version}_linux_amd64.tar.gz"
      sha256 "1e9e1306039bbe07a482e22f7289bfade5d671796308120351038e2018715df3"
    end
  end

  def install
    bin.install "miso"
  end

  test do
    system "#{bin}/miso", "version"
  end
end
