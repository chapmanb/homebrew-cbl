require 'formula'

class Discovar < Formula
  homepage "http://www.broadinstitute.org/software/discovar/blog/"
  version "2015-02-22-52188"
  url "ftp://ftp.broadinstitute.org/pub/crd/Discovar/latest_source_code/discovar-52188.tar.gz"
  sha1 "7e850fc61c4f12f4e063dd95d1b58a8a07f5be27"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "discovar"
  end
end
