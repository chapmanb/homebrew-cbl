require 'formula'

class RnaStar < Formula
  homepage 'https://code.google.com/p/rna-star'
  version '2.3.1z'
  # Need latest alpha release to work around 13.04 compile error
  # https://groups.google.com/forum/#!topic/rna-star/13S344Jknf4
  url 'ftp://ftp2.cshl.edu/gingeraslab/tracks/STARrelease/Alpha/STAR_2.3.1z.tgz'
  sha1 'a8a5e5a6d9475e0558f1ee66333770fd4ed87ceb'

  def install
    system 'make'
    bin.install 'STAR'
  end

end
