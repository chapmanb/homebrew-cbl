require 'formula'

class Bcftools < Formula
  homepage 'https://github.com/samtools/bcftools'
  version '0.2.0-rc5'
  url "https://github.com/samtools/bcftools/archive/#{version}.tar.gz"
  sha1 'cd9c64b5668b2227e9acf71b893e5523048afb6d'
  #depends_on 'chapmanb/cbl/htslib'

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
    system 'bcftools'
  end
end
