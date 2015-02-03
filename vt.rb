require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2015-02-02'
  url "https://github.com/atks/vt/archive/e51d17e.tar.gz"
  sha1 "0f79a4082be82c9abab54bd2846d0c6e727dedce"

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
