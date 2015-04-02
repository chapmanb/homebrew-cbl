
class TophatBinary < Formula
  homepage "http://ccb.jhu.edu/software/tophat"
  version "2.0.14"

  if OS.mac?
    url "http://ccb.jhu.edu/software/tophat/downloads/tophat-#{version}.OSX_x86_64.tar.gz"
    sha256 "aa57a2f40b0813b4404d3b462db0ad54f93f6a2e71a826541dd15e04cda75d09"
  else
    url "http://ccb.jhu.edu/software/tophat/downloads/tophat-#{version}.Linux_x86_64.tar.gz"
    sha256 "273894525b81052537f1a8cb464a7eb7ffbef78e2f34b0ac2b22c3964a7c9748"
  end

  def install
    bin.install Dir['*']
  end
end
