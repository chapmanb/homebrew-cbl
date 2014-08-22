require 'formula'

class SnapAligner < Formula
  homepage 'http://snap.cs.berkeley.edu/'
  version '1.0dev.38'
  url 'https://github.com/amplab/snap.git', :revision => '640feb7a7', :branch => 'dev'

  def install
    system 'make'
    bin.install 'snap'
    doc.install Dir["docs/*.pdf"]
  end

  test do
    system 'snap'
  end
end
