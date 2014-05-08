require 'formula'

class Biobambam < Formula
  homepage 'https://github.com/gt1/biobambam'
  version '0.0.140'
  url 'https://github.com/gt1/biobambam/archive/0.0.140-release-20140507195250.tar.gz'
  sha1 '2388db73e09e7cf6bba1159401e912f54f8828c9'

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
