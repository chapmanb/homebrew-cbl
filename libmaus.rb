require 'formula'

class Libmaus < Formula
  homepage 'https://github.com/gt1/libmaus'
  version '0.0.115'
  url 'https://github.com/gt1/libmaus/archive/0.0.115-release-20140423163910.tar.gz'
  sha1 'fcc13c3bf825ee7134b100e94bbc8c929b107094'

  def install
    system './configure', "--prefix=#{prefix}"
    system 'make'
    system 'make install'
  end
end
