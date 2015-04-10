require 'formula'

class SambambaBinary < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.5.2'
  if OS.mac?
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_osx.tar.bz2"
    sha1 "caf3c1259cd30acc1b71470334f77a2bcb1170a2"
  else
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_linux.tar.bz2"
    sha1 "bc195de83029a55d0f9a8abfb200a674584c8fd2"
  end

  def install
    bin.install "sambamba_v#{version}" => "sambamba"
  end

  test do
    system 'sambamba index'
  end
end
