require 'formula'

class Htslib < Formula
  homepage 'https://github.com/samtools/htslib'
  version '0.2.0-rc6'
  url "https://github.com/samtools/htslib/archive/#{version}.tar.gz"
  sha1 '08cd1cb79321b3928167c777aca8fa473493fca9'
  head 'https://github.com/samtools/htslib/archive/develop.tar.gz'

  def install
    # htslib is too aggressive with VCF versions and GATK currently complains about v4.2
    inreplace 'vcf.c', 'VCFv4.2', 'VCFv4.1'
    # Write version since current Makefile logic fails on non-gmake systems
    system "echo '#define HTS_VERSION \"#{version}\"' > version.h"
    system 'make'
    system 'make', 'install', 'prefix=' + prefix
    prefix.install 'version.h'
  end
end
