require 'formula'

class StadenIoLib < Formula
  homepage 'http://staden.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/staden/io_lib/1.13.5/io_lib-1.13.5.tar.gz'
  sha1 '0b8c99b3a62d1c8f19e4f1ab6b0aad9960568599'

  def install
    system './configure', "--prefix=#{prefix}"
    system 'make'
    system 'make install'
  end

  test do
    system 'scramble', '-h'
  end

end
