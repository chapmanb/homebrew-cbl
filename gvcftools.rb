require 'formula'

class Gvcftools < Formula
  homepage "https://sites.google.com/site/gvcftools/"
  version "0.16"
  url "https://sites.google.com/site/gvcftools/home/download/gvcftools-0.16.tar.gz"
  sha1 "ae1343d00163b98b1bb03ef0f91fc9726c17bd59"

  def install
    system "make"
    bin.install Dir['bin/*']
  end
end
