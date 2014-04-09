require 'formula'

class Samblaster < Formula
  homepage 'https://github.com/GregoryFaust/samblaster'
  url 'https://github.com/GregoryFaust/samblaster/archive/0.1.14.tar.gz'
  sha1 '9fe3f179d30c92f0125dea9e0c5d319cef742998'

  def install
    system 'make'
    bin.install 'samblaster'
  end

  test do
    system 'samblaster'
  end
end
