require 'formula'

class Samblaster < Formula
  homepage 'https://github.com/GregoryFaust/samblaster'
  url 'https://github.com/GregoryFaust/samblaster/releases/download/v.0.1.16/samblaster-v.0.1.16.tar.gz'
  sha1 '07a217a94386939ebb55ea97028aba20d5881949'

  def install
    system 'make'
    bin.install 'samblaster'
  end

  test do
    system 'samblaster'
  end
end
