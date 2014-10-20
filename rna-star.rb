require 'formula'

class RnaStar < Formula
  homepage 'https://code.google.com/p/rna-star'
  version '2.4.0d'
  url 'https://github.com/alexdobin/STAR/archive/STAR_2.4.0d.tar.gz'
  sha1 '2e5870a78fcbc3c6662802e13eb7fb649b10c7fd'

  def install
    bin.install 'STARstatic' => 'STAR'
    bin.install_symlink '../libexec/wrappers/trans-abyss'
  end

end
