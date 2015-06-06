require 'formula'

class CanceritAllelecount < Formula
  homepage "https://github.com/cancerit/alleleCount"
  version "2.1.0"
  url "https://github.com/cancerit/alleleCount/archive/v2.1.0.tar.gz"
  sha1 "f68df902ca5c6d1794e3c4ad05a428e03da8f9a2"

  resource "htslib" do
    url "https://github.com/samtools/htslib/archive/1.2.tar.gz"
    sha1 "de903ec8f92ea86872dbd0dd7f5d419c58366e8b"
  end

  def install
    htslib = buildpath / "htslib"
    resource("htslib").stage do
      system "patch -p0 < #{buildpath}/patches/htslibcramindex.diff"
      system "make"
      htslib.install Dir["*"]
    end
    cd "c"
    mkdir "bin"
    system "make", "OPTINC=-I#{htslib}", "HTSLOC=#{htslib}"
    bin.install Dir["bin/*"]
  end

  test do
    system "alleleCounter -h"
  end
end
