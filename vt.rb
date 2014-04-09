require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2014-04-09'
  url 'https://github.com/atks/vt.git', :revision => 'a7c50713594'

  def install
    system 'make'
    bin.install 'vt'
  end

  test do
    system 'vt'
  end
end
