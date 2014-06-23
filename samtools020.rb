require 'formula'

class Samtools020 < Formula
  homepage 'http://samtools.sourceforge.net/'
  #doi '10.1093/bioinformatics/btp352'
  version '0.2.0-rc9'
  url "https://github.com/samtools/samtools/archive/#{version}.tar.gz"
  sha1 '60178a58d03385ca67a8be0a4b7d07f347ad4c54'
  depends_on 'htslib'

  def install
    inreplace 'Makefile', 'include $(HTSDIR)/htslib.mk', \
      'htslib_sam_h = $(HTSDIR)/htslib/sam.h $(HTSDIR)/htslib/hts.h'
    inreplace "Makefile", "$(HTSDIR)/version.h", "$(HTSDIR)/htslib/version.h"
    #inreplace "Makefile", "$(HTSDIR)/htslib", "$(HTSDIR)/include/htslib"
    htslib = Formula["htslib"].opt_prefix
    # Write version to avoid 0.0.1 version information output from Makefile
    system "echo '#define SAMTOOLS_VERSION \"#{version}\"' > version.h"
    system *%W[make samtools HTSDIR=#{htslib}/include HTSLIB=#{htslib}/lib/libhts.a]
    bin.install 'samtools' => 'samtools020'
  end

  test do
    system 'samtools020 2>&1 |grep -q samtools'
  end
end
