require 'formula'

class Sambamba < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.4.4'

  if OS.mac?
    url 'https://github.com/lomereiter/sambamba/releases/download/v0.4.4/sambamba_v0.4.4_osx.tar.bz2'
    sha1 '2eb39b5c8100dca487f3d288f90dfc7cb2a8e4d3'
  else
    url 'https://github.com/lomereiter/sambamba/releases/download/v0.4.4/sambamba_v0.4.4_centos5.tar.bz2'
    sha1 '1dde69de12475fb6e5cf6dd1ed9392d73091bedd'
  end

  def install
    bin.install 'sambamba_v0.4.4' => 'sambamba'
  end

  test do
    system 'sambamba', 'index'
  end
end
