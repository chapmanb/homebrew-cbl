require 'formula'

class Libmaus < Formula
  homepage 'https://github.com/gt1/libmaus'
  version '0.0.120'
  url 'https://github.com/gt1/libmaus/archive/0.0.120-release-20140507195158.tar.gz'
  sha1 'c6449ac58f83df0eba1cc980a82e57be0450f5d5'

  depends_on 'pkg-config'
  depends_on 'staden_io_lib'

  def install
    iolib = Formula["staden_io_lib"].opt_prefix
    system './configure', "--prefix=#{prefix}", "--with-io-lib=#{iolib}"
    system 'make'
    system 'make install'
  end
end
