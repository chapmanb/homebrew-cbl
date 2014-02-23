require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2014-02-21'
  url 'https://github.com/atks/vt.git', :revision => '1f867ee0a5ae'

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
