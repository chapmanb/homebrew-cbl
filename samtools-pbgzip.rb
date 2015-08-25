# Formula to get pbgzip from Nils Homer's Samtools Fork
# https://github.com/nh13/samtools/tree/master/pbgzip

class SamtoolsPbgzip < Formula

  homepage "http://samtools.sourceforge.net/"
  version "0.1.2"
  url "https://github.com/nh13/samtools/archive/master.zip"
  sha256 "ad62e35446dc3d0731c0c2066c158f8a83745ca270aed98aac88eddbb1c2c732"

  def install
    cd 'pbgzip' do
      # Disable bzip2 support until fixed upstream
      inreplace "Makefile" do |s|
        s.gsub! "#-DDISABLE_BZ2", "-DDISABLE_BZ2"
        s.gsub! "-lbz2", ""
      end
      system "make"
      bin.install "pbgzip"
    end
  end
end
