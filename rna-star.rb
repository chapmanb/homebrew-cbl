require 'formula'

class RnaStar < Formula
  homepage 'https://code.google.com/p/rna-star'
  version '2.4.0f1'
  url 'https://github.com/alexdobin/STAR/archive/STAR_2.4.0f1.tar.gz'
  sha1 '17ec3989ac226e8c8ea831d38da9d6cd039791c5'

  def install
    if OS.mac?
      bin.install 'bin/MacOSX_x86_64/STAR' => 'STAR'
    else
      bin.install 'bin/Linux_x86_64_static/STAR' => 'STAR'
    end
    bin.install_symlink '../libexec/wrappers/trans-abyss'
  end

end
