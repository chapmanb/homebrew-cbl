require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2014-09-25'
  url "https://github.com/atks/vt/archive/7f8ada9f.tar.gz"

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
