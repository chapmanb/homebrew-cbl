require 'formula'

class Sambamba < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.4.3'
  url 'https://github.com/lomereiter/sambamba/releases/download/v0.4.3/sambamba_v0.4.3_centos5.tar.bz2'
  sha1 'd181e952c9d63ac7391fbb9a5ba4119d24e1c69d'

  def install
    raise 'sambamba not yet supported for MacOSX' if OS.mac?
    bin.install 'sambamba_v0.4.3' => 'sambamba'
  end

  test do
    system 'sambamba', 'index'
  end
end
