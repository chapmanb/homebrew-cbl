require 'formula'

class Pindel < Formula
  homepage 'http://gmt.genome.wustl.edu/packages/pindel/index.html'
  version '0.2.5'
  url "https://github.com/genome/pindel.git"
  depends_on "samtools" => :build
  def install
    samtools =  "#{HOMEBREW_PREFIX}/include/bam" 
    system "./INSTALL  #{samtools}"
    bin.install "pindel" => 'pindel'
  end

  test do
    system 'pindel -h'
  end
end
