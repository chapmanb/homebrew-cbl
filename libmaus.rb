require 'formula'

class Libmaus < Formula
  homepage 'https://github.com/gt1/libmaus'
  version '0.0.147'
  url 'https://github.com/gt1/libmaus/archive/0.0.147-release-20140714102038.tar.gz'
  sha1 '4dd3b0d7f481da958f9b5567265965513e2465f7'

  depends_on 'pkg-config'
  depends_on 'staden_io_lib'

  def install
    iolib = Formula["staden_io_lib"].opt_prefix
    system './configure', "--prefix=#{prefix}", "--with-io-lib=#{iolib}"
    system 'make'
    system 'make install'
  end
end
