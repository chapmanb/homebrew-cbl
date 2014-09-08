require 'formula'

class TophatBinary < Formula
  homepage 'http://ccb.jhu.edu/software/tophat'
  version '2.0.12.1'

  if OS.mac?
    url "http://ccb.jhu.edu/software/tophat/downloads/tophat-2.0.12.OSX_x86_64.tar.gz"
    sha1 '796d22e87aa1fbcbfc667ecab2d4a575b3b8602d'
  else
    url "http://ccb.jhu.edu/software/tophat/downloads/tophat-2.0.12.Linux_x86_64.tar.gz"
    sha1 'e3c4858fe43351dc125b478f83656916966cde41'
  end

  patch do
    # Enable support for samtools 1.0 in tophat samtools checks
    url 'https://gist.githubusercontent.com/chapmanb/b04cccddfe1e18c2b542/raw/a2d5626109454a83c7b0431860b33934d5d29b32/tophat_samtools_10.diff'
    sha1 'a89741de6405979113e8d8727702bc35d14b69f1'
  end

  def install
    bin.install Dir['*']
  end
end
