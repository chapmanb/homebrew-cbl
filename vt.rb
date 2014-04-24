require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2014-04-23'
  url 'https://github.com/atks/vt.git', :revision => '22894f949a'

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
