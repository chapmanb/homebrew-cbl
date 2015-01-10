require 'formula'

class SambambaBinary < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.5.1'
  if OS.mac?
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_osx.tar.bz2"
    sha1 "0a5aa5a52263ad15f1453cc90fb8f5499d3280d6"
  else
    url "https://github.com/lomereiter/sambamba/releases/download/v#{version}/sambamba_v#{version}_linux.tar.bz2"
    sha1 "ff6942043e42e1ffb5ba74f9d62c5ac9c40e0f25"
  end

  def install
    bin.install "sambamba_v#{version}" => 'sambamba'
  end

  test do
    system 'sambamba index'
  end
end
