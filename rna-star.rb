require 'formula'

class RnaStar < Formula
  homepage 'https://code.google.com/p/rna-star'
  version '2.3.1z4'
  url 'http://it-collab01.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARreleases/Patches/STAR_2.3.1z4.tgz'
  sha1 'e46fdf32e6305c4120ced2b62db073012bebf4ad'

  def install
    bin.install 'STAR'
  end

end
