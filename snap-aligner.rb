require 'formula'

class SnapAligner < Formula
  homepage 'http://snap.cs.berkeley.edu/'
  version '1.0beta.13'
  url "https://github.com/amplab/snap/archive/63d75ceec.tar.gz"
  sha1 "b5f65e9632804aadd77b3b11b6d3609303f6e179"

  def install
    system 'make'
    bin.install 'snap'
    doc.install Dir["docs/*.pdf"]
  end

  test do
    system 'snap'
  end
end
