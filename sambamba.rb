require 'formula'

class Sambamba < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.4.3'

  if OS.mac?
    url 'https://github.com/lomereiter/sambamba/releases/download/v0.4.3/sambamba_v0.4.3_osx.tar.bz2'
    sha1 'f0ca3c03a1a17673c35fa5e03665fce3fdc8f3b8'
  else
    url 'https://github.com/lomereiter/sambamba/releases/download/v0.4.3/sambamba_v0.4.3_centos5.tar.bz2'
    sha1 'd181e952c9d63ac7391fbb9a5ba4119d24e1c69d'
  end

  def install
    bin.install 'sambamba_v0.4.3' => 'sambamba'
  end

  test do
    system 'sambamba', 'index'
  end
end
