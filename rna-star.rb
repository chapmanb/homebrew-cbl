require 'formula'

class RnaStar < Formula
  homepage 'https://code.google.com/p/rna-star'
  version '2.4.0fh'
  url 'https://github.com/alexdobin/STAR/archive/STAR_2.4.0h.tar.gz'
  sha1 'b02fbd5a395351b9ca36e1907e869474351fe6ed'

  def install
    if OS.mac?
      bin.install 'bin/MacOSX_x86_64/STAR' => 'STAR'
    else
      bin.install 'bin/Linux_x86_64_static/STAR' => 'STAR'
    end
    bin.install_symlink '../libexec/wrappers/trans-abyss'
  end

end
