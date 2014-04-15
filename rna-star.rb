require 'formula'

class RnaStar < Formula
  homepage 'https://code.google.com/p/rna-star'
  version '2.3.1z'
  # Need latest alpha release to work around 13.04 compile error
  # https://groups.google.com/forum/#!topic/rna-star/13S344Jknf4
  url 'https://github.com/alexdobin/STAR/archive/ENCODE_2014-03-16_2.3.1z1.tar.gz'
  sha1 '44f285196846f7731f298e7b7f2568201de25252'

  def install
    bin.install 'STAR'
  end

end
