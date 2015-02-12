require 'formula'

class Pindel < Formula
  homepage 'http://gmt.genome.wustl.edu/packages/pindel/index.html'
  version '0.2.5a7'
  url 'https://github.com/genome/pindel/archive/bcbio.tar.gz'
  sha1 '6c083730d24ed4097e9f859c24c6a090e202dd3a'

  # Requires samtools 0.1.19
  # depends_on 'samtools' => :build 
  resource 'samtools' do
    url 'https://downloads.sourceforge.net/project/samtools/samtools/0.1.19/samtools-0.1.19.tar.bz2'
    sha1 'ff3f4cf40612d4c2ad26e6fcbfa5f8af84cbe881'
  end
  
  def install
    samtools = prefix / 'samtools'
    resource('samtools').stage do
      # Build without curses
      inreplace "Makefile" do |s|
        s.gsub! "-D_CURSES_LIB=1", "-D_CURSES_LIB=0"
        s.gsub! "-lcurses", "# -lcurses"
      end
      system 'make'
      samtools.install Dir['*']
    end
    inreplace "src/Makefile", "$(LDFLAGS)", ""
    system "echo 'SAMTOOLS=#{samtools}' > Makefile.local"
    system "./INSTALL  #{samtools}"
    bin.install %w{pindel pindel2vcf sam2pindel}
  end

  test do
    system 'pindel -h'
  end
end
