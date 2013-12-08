require 'formula'

# Provides development version of samtools that does not include bcftools
# For compatibility with development htslib and bcftools.
# Conflicts with:
#  science/tabix (also provides bgzip, tabix now in new bcftools)
#  science/samtools

class Samtools < Formula
  homepage 'https://github.com/samtools/samtools'
  version '0.2.0-rc5'
  url "https://github.com/samtools/samtools/archive/#{version}.tar.gz"
  sha1 '16e58de6e0d9fe68b333a832fd1e8c4ede51685b'
  depends_on 'chapmanb/cbl/htslib'

  def install
    inreplace 'Makefile', 'include $(HTSDIR)/htslib.mk', ''
    htslib = Formula.factory('htslib').opt_prefix
    inreplace 'Makefile' do |s|
      s.change_make_var! 'HTSDIR', htslib
      s.change_make_var! 'HTSLIB', "#{htslib}/lib/libhts.a"
      s.change_make_var! 'INCLUDES', "-I. -I#{htslib}/include"
      s.gsub! '$(HTSDIR)/htslib/', '$(HTSDIR)/include/htslib/'
    end
    system 'make'
    system 'make', 'install', 'prefix=' + prefix
  end

  test do
    system 'samtools 2>&1 |grep -q samtools'
  end
end
