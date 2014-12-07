require 'formula'

class TophatBinary < Formula
  homepage 'http://ccb.jhu.edu/software/tophat'
  version '2.0.13'

  if OS.mac?
    url "http://ccb.jhu.edu/software/tophat/downloads/tophat-2.0.13.OSX_x86_64.tar.gz"
    sha1 'b40cdc6442089d0cf22387bf18d64abf43fe279f'
  else
    url "http://ccb.jhu.edu/software/tophat/downloads/tophat-2.0.13.Linux_x86_64.tar.gz"
    sha1 'e313f188b97f143ec7c3a9ed9c7a702e0463ea24'
  end

  def install
    bin.install Dir['*']
  end
end
