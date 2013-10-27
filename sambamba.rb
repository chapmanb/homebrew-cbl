require 'formula'

class Sambamba < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.4.0'
  url 'https://github.com/lomereiter/sambamba/releases/download/v0.4.0/sambamba_v0.4.0_centos5.tar.bz2'
  sha1 '3ee6ffce2d9e784dbbf6535e47cefdedf3406176'

  def install
    raise 'sambamba not yet supported for MacOSX' if OS.mac?
    bin.install 'sambamba_v0.4.0' => 'sambamba'
  end

  test do
    system 'sambamba', 'index'
  end
end
