require 'formula'

class Sambamba < Formula
  homepage 'https://github.com/lomereiter/sambamba'
  version '0.4.1'
  url 'https://github.com/lomereiter/sambamba/releases/download/v0.4.1/sambamba_v0.4.1b_centos5.tar.bz2'
  sha1 '7b7c4173133c65848086964c07fd980d75df136a'

  def install
    raise 'sambamba not yet supported for MacOSX' if OS.mac?
    bin.install 'sambamba_v0.4.1b' => 'sambamba'
  end

  test do
    system 'sambamba', 'index'
  end
end
