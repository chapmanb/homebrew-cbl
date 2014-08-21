require 'formula'

class SnapAligner < Formula
  homepage 'http://snap.cs.berkeley.edu/'
  version '1.0beta.10'
  if OS.mac?
    url 'http://snap.cs.berkeley.edu/downloads/snap-1.0beta.1-mac.zip'
    sha1 'b4c9338b53e87a5c80dd54b74738c2bd46947fd1'
  else
    url 'http://snap.cs.berkeley.edu/downloads/snap-1.0beta.10-linux.tar.gz'
    sha1 'c72952d40e167d1d86d99427a43b12fa3c1fe4cb'
  end

  devel do
    version '1.0dev.38'
    url 'https://github.com/amplab/snap.git', :revision => '640feb7a7', :branch => 'dev'
  end

  def install
    if build.devel?
      system 'make'
      bin.install 'snap'
    else
      bin.install 'snap'
      bin.install 'snapxl' if not OS.mac?
      doc.install Dir["*.pdf"]
    end
  end

  test do
    system 'snap'
  end
end
