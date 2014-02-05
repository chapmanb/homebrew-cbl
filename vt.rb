require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2014-02-01'
  url 'https://github.com/atks/vt.git', :revision => '576b299c01'

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
