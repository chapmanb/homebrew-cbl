require 'formula'

class TophatBinary < Formula
  homepage 'http://ccb.jhu.edu/software/tophat'
  version '2.0.12'

  if OS.mac?
    url "http://ccb.jhu.edu/software/tophat/downloads/tophat-#{version}.OSX_x86_64.tar.gz"
    sha1 '796d22e87aa1fbcbfc667ecab2d4a575b3b8602d'
  else
    url "http://ccb.jhu.edu/software/tophat/downloads/tophat-#{version}.Linux_x86_64.tar.gz"
    sha1 'e3c4858fe43351dc125b478f83656916966cde41'
  end

  def install
    if OS.mac?
      bin.install Dir['*']
    else
      bin.install Dir['*']
    end
  end
end
