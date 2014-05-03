require 'formula'

class RnaStar < Formula
  homepage 'https://code.google.com/p/rna-star'
  version '2.3.1z3'
  # Need latest alpha release to work around 13.04 compile error
  # https://groups.google.com/forum/#!topic/rna-star/13S344Jknf4
  url 'http://it-collab01.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARreleases/Patches/STAR_2.3.1z3.tgz'
  sha1 '843e66d8e4f3e8119596dbc15cdd30c65f43907e'

  def install
    bin.install 'STAR'
  end

end
