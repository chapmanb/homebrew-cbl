require 'formula'

class RnaStar < Formula
  homepage 'https://code.google.com/p/rna-star'
  version '2.3.1z3'
  url 'http://it-collab01.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARreleases/Patches/STAR_2.3.1z.tgz'
  sha1 'a8a5e5a6d9475e0558f1ee66333770fd4ed87ceb'

  def install
    bin.install 'STAR'
  end

end
