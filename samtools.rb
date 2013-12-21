require 'formula'

# 0.19 build of samtools, avoiding installation of bcftools which conflicts
# with 0.20 release.
#
# Also Provides development version of samtools that does not include bcftools
# For compatibility with development htslib and bcftools.
# Conflicts with:
#  science/tabix (also provides bgzip, tabix now in new bcftools)
#  science/samtools

class Samtools < Formula
  homepage 'https://github.com/samtools/samtools'
  url 'http://downloads.sourceforge.net/project/samtools/samtools/0.1.19/samtools-0.1.19.tar.bz2'
  sha1 'ff3f4cf40612d4c2ad26e6fcbfa5f8af84cbe881'

  devel do
    version '0.2.0-rc5'
    url "https://github.com/samtools/samtools/archive/#{version}.tar.gz"
    sha1 '16e58de6e0d9fe68b333a832fd1e8c4ede51685b'
    depends_on 'chapmanb/cbl/htslib'
  end

  def install
    if build.devel?
        inreplace 'Makefile', 'include $(HTSDIR)/htslib.mk', ''
        htslib = Formula.factory('htslib').opt_prefix
        inreplace 'Makefile' do |s|
          s.change_make_var! 'HTSDIR', htslib
          s.change_make_var! 'HTSLIB', "#{htslib}/lib/libhts.a"
          s.change_make_var! 'INCLUDES', "-I. -I#{htslib}/include"
          s.gsub! '$(HTSDIR)/htslib/', '$(HTSDIR)/include/htslib/'
        end
        # Write version since current Makefile logic fails on non-gmake systems
        system "echo '#define SAMTOOLS_VERSION \"#{version}\"' > version.h"
        system 'make'
        system 'make', 'install', 'prefix=' + prefix
    else
        system 'make'
        bin.install %w{samtools}
        bin.install %w{bcftools/vcfutils.pl}
        bin.install %w{misc/maq2sam-long misc/maq2sam-short misc/md5fa misc/md5sum-lite misc/wgsim}
        bin.install Dir['misc/*.pl']
        lib.install 'libbam.a'
        man1.install %w{samtools.1}
        (share+'samtools').install %w{examples}
        (include+'bam').install Dir['*.h']
      end
  end

  test do
    system 'samtools 2>&1 |grep -q samtools'
  end
end
