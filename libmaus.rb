require 'formula'

class Libmaus < Formula
  homepage 'https://github.com/gt1/libmaus'
  version '0.0.104'
  url 'https://github.com/gt1/libmaus/archive/0.0.104-release-20140221093548.tar.gz'
  sha1 'faddd9320d8e141e68da7c6104907e8cf17234b9'

  patch do
    url "https://gist.githubusercontent.com/roryk/10664112/raw/6c3b366c4ba87514ca0753ef42439d65a6b12838/p1.patch"
    sha1 '173aa28a37d5987b84f51ed7109399f1201e3c4e'
  end 

  def install
    system './configure', "--prefix=#{prefix}"
    system 'make'
    system 'make install'
  end
end
