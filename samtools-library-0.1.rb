class SamtoolsLibrary01 < Formula
  # Only library requirements for samtools 0.1
  # For linking with builds like the Bio::DB::Sam perl module
  homepage "http://samtools.sourceforge.net/"
  # doi "10.1093/bioinformatics/btp352"
  # tag "bioinformatics"

  url "https://github.com/samtools/samtools/archive/0.1.20.tar.gz"
  sha256 "500019b4d1886ad995513d5ce8b413b14b51f16f251ce76bc0b35a446b182a47"

  def install
    inreplace "Makefile" do |s|
      s.gsub! "-D_CURSES_LIB=1", "-D_CURSES_LIB=0"
      s.gsub! "-lcurses", "# -lcurses"
    end
    system "make CFLAGS='-g -Wall -O2 -fPIC'"
    (share+"samtools-0.1"+"lib").install "libbam.a"
    (share+"samtools-0.1"+"include").install Dir["*.h"]
  end

  test do
  end
end
