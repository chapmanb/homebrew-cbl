require 'formula'

class Libmaus < Formula
  homepage 'https://github.com/gt1/libmaus'
  version '0.0.104'
  url 'https://github.com/gt1/libmaus/archive/0.0.104-release-20140221093548.tar.gz'
  sha1 'faddd9320d8e141e68da7c6104907e8cf17234b9'

  def install
    system './configure', "--prefix=#{prefix}"
    system 'make'
    system 'make install'
  end
end
