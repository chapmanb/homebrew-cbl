require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2015-02-10'
  url "https://github.com/atks/vt/archive/a632462.tar.gz"
  sha1 "1fc41946edc05cae5df44f8216c2339ea9d7157f"

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
