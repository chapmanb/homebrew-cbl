require 'formula'

class Biobambam < Formula
  homepage 'https://github.com/gt1/biobambam'
  version '0.0.154'
  url 'https://github.com/gt1/biobambam/archive/0.0.154-release-20140709001615.tar.gz'
  sha1 'fec4738a871d6d7110ae1e793f598351cf9eda16'

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
