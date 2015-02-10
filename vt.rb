require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2015-02-09'
  url "https://github.com/chapmanb/vt/archive/44a1ec7.tar.gz"
  sha1 "c2530cf3d306e6dc32172709b768db69f2ae01b1"

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
