require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2014-08-16'
  url 'https://github.com/atks/vt.git', :revision => 'e33fc00b3b'

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
