require 'formula'

class Biobambam < Formula
  homepage 'https://github.com/gt1/biobambam'
  version '0.0.182'
  url 'https://github.com/gt1/biobambam/archive/0.0.182-release-20141201100458.tar.gz'
  sha1 '799a6e6d80b2044b9b7fcc0fb300cb9d688c27f8'

  depends_on 'libmaus'

  def install
    system "export PKG_CONFIG=$(export PATH=#{HOMEBREW_PREFIX}/bin:$PATH && which pkg-config)"
    system './configure', "--prefix=#{prefix}"
    system 'make'
    system 'make install'
  end

  test do
    system 'bamtofastq -h'
  end
end
