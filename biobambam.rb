require 'formula'

class Biobambam < Formula
  homepage 'https://github.com/gt1/biobambam'
  version '0.0.131'
  url 'https://github.com/gt1/biobambam/archive/0.0.131-release-20140411101450.tar.gz'
  sha1 '31ef9b90b2198c83df50976002858ad5445f1194'

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
