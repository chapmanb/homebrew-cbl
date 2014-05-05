require 'formula'

class Biobambam < Formula
  homepage 'https://github.com/gt1/biobambam'
  version '0.0.138'
  url 'https://github.com/gt1/biobambam/archive/0.0.138-release-20140501104209.tar.gz'
  sha1 'c13f3110a691bbb0101e22ee2f9618de3c4caa8e'

  depends_on 'libmaus'

  def install
    system 'export PKG_CONFIG=$(which pkg-config)'
    inreplace 'configure', 'src/Makefile test/Makefile', 'src/Makefile'
    inreplace 'Makefile.in', 'SUBDIRS = src @TESTDIR@', 'SUBDIRS = src'
    system './configure', "--prefix=#{prefix}"
    system 'make'
    system 'make install'
  end

  test do
    system 'bamtofastq -h'
  end
end
