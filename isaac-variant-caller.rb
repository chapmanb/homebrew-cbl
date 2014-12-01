require 'formula'

class IsaacVariantCaller < Formula
  homepage "https://github.com/sequencing/isaac_variant_caller"
  version "1.0.6"
  url "https://github.com/sequencing/isaac_variant_caller/archive/v1.0.6.tar.gz"
  sha1 "9e52604a48e5659c30cac9eb2a5d9ef7509111e0"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
