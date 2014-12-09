require 'formula'

class Libmaus < Formula
  homepage 'https://github.com/gt1/libmaus'
  version '0.0.185'
  url 'https://github.com/gt1/libmaus/archive/0.0.185-release-20141201090944.tar.gz'
  sha1 '58997dc25fed89a296fddaf5441cf3985b02a6b8'

  depends_on 'pkg-config'
  depends_on 'staden_io_lib'

  def install
    iolib = Formula["staden_io_lib"].opt_prefix
    system './configure', "--prefix=#{prefix}", "--with-io-lib=#{iolib}"
    system 'make'
    system 'make install'
  end
end
