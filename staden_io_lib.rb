require 'formula'

class StadenIoLib < Formula
  homepage 'http://staden.sourceforge.net/'
  version '1.13.7'
  url "http://downloads.sourceforge.net/project/staden/io_lib/#{version}/io_lib-#{version}.tar.gz"
  sha1 '4f96f7e25f58d7396e53a66b235a37b55e622f41'

  def install
    system './configure', "--prefix=#{prefix}"
    system 'make'
    system 'make install'
  end

  test do
    system 'scramble', '-h'
  end

end
