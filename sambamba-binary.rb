require 'formula'

class SambambaBinary < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.5.1'
  if OS.mac?
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_osx.tar.bz2"
    sha1 "5d916fc1314913557988382822b9f9f070795ca5"
  else
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_linux.tar.bz2"
    sha1 "bc7a02d2b377782593f2c06c6f3550417a9984cb"
  end

  def install
    bin.install "sambamba_v#{version}" => 'sambamba'
  end

  test do
    system 'sambamba index'
  end
end
