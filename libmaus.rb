require 'formula'

class Libmaus < Formula
  homepage 'https://github.com/gt1/libmaus'
  version '0.0.117'
  url 'https://github.com/gt1/libmaus/archive/0.0.117-release-20140501103431.tar.gz'
  sha1 'e42bda3b656920e13262ca3294bbefe4fefd6674'

  depends_on 'staden_io_lib'

  def install
    iolib = Formula["staden_io_lib"].opt_prefix
    system './configure', "--prefix=#{prefix}", "--with-io-lib=#{iolib}"
    system 'make'
    system 'make install'
  end
end
