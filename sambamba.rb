require 'formula'

class Sambamba < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.4.6'
  if OS.mac?
    url 'https://github.com/lomereiter/sambamba/releases/download/v0.4.6/sambamba_v0.4.6_osx.tar.bz2'
    sha1 'e92ae523a56c2754d731aabf5854e23030f466b7'
  else
    url 'https://github.com/lomereiter/sambamba/releases/download/v0.4.6/sambamba_v0.4.6_centos5.tar.bz2'
    sha1 'c7679176877325a3c83998fa1e6095dfe94b42ee'
  end

  def install
    bin.install 'sambamba_v0.4.6' => 'sambamba'
  end

  test do
    system 'sambamba index'
  end
end
