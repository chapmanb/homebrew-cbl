require 'formula'

class SnapAligner < Formula
  homepage 'http://snap.cs.berkeley.edu/'
  version '1.0dev.40'
  url 'https://github.com/amplab/snap.git', :revision => '42fab0b61', :branch => 'dev'

  def install
    system 'make'
    bin.install 'snap'
    doc.install Dir["docs/*.pdf"]
  end

  test do
    system 'snap'
  end
end
