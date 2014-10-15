require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2014-10-14'
  url "https://github.com/atks/vt/archive/7bcc52d32c.tar.gz"
  sha1 "d3cd080448dee2d2c67034c66c9a7737def20fda"

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
