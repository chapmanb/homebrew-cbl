require 'formula'

class RnaStar < Formula
  homepage 'https://code.google.com/p/rna-star'
  version '2.4.0j'
  url 'https://github.com/alexdobin/STAR/archive/STAR_2.4.0j.tar.gz'
  sha1 'efb1d31ae098673fd03a6269ea97c01bdc82cc96'

  def install
    if OS.mac?
      bin.install 'bin/MacOSX_x86_64/STAR' => 'STAR'
    else
      bin.install 'bin/Linux_x86_64_static/STAR' => 'STAR'
    end
    bin.install_symlink '../libexec/wrappers/trans-abyss'
  end

end
