require 'formula'

class Htslib < Formula
  homepage 'https://github.com/samtools/htslib'
  version '0.2.0-rc5'
  url "https://github.com/samtools/htslib/archive/#{version}.tar.gz"
  sha1 'e14d7f98293a0a78d5f09f6eae3f3332b0556ef7'
  head 'https://github.com/samtools/htslib/archive/develop.tar.gz'

  def install
    system 'make'
    system 'make', 'install', 'prefix=' + prefix
  end
end
