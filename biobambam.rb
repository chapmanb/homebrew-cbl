require 'formula'

class Biobambam < Formula
  homepage 'https://github.com/gt1/biobambam'
  version '0.0.125'
  url 'https://github.com/gt1/biobambam/archive/0.0.125-release-20140221093621.tar.gz'
  sha1 '29b6d384d5ff443f385c9b1733e93217126e8743'

  depends_on 'libmaus'

  def install
    system 'export PKG_CONFIG=$(which pkg-config)'
    system './configure', "--prefix=#{prefix}"
    system 'make'
    system 'make install'
  end

  test do
    system 'bamtofastq -h'
  end
end
