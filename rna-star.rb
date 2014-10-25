require 'formula'

class RnaStar < Formula
  homepage 'https://code.google.com/p/rna-star'
  version '2.4.0e'
  url 'https://github.com/alexdobin/STAR/archive/STAR_2.4.0e.tar.gz'
  sha1 '6ad268a774ebb24b8262dd333d68e6efe21bf7bc'

  def install
    if OS.mac?
      bin.install 'bin/MacOSX_x86_64/STAR' => 'STAR'
    else
      bin.install 'bin/Linux_x86_64_static/STAR' => 'STAR'
    end
    bin.install_symlink '../libexec/wrappers/trans-abyss'
  end

end
