require 'formula'

class RnaStar < Formula
  homepage 'https://code.google.com/p/rna-star'
  version '2.4.0c'
  url 'https://github.com/alexdobin/STAR/archive/STAR_2.4.0c.tar.gz'
  sha1 '376bbb9827f608215dedfd423b342ee41ebae129'

  def install
    bin.install 'STARstatic' => 'STAR'
    bin.install_symlink '../libexec/wrappers/trans-abyss'
  end

end
