# Get and install pbgzip

class Pbgzip < Formula

  homepage "https://github.com/nh13/pbgzip"
  version "0.1"
  url "https://github.com/nh13/pbgzip/archive/master.zip"
  sha256 "4a698e7be0ef32cf21bd73e31f197b726b1c624191854286f80c66a963fb9099"

  def install
    # Disable bzip2 support until fixed upstream
    inreplace "Makefile" do |s|
      s.gsub! "#-DDISABLE_BZ2", "-DDISABLE_BZ2"
      s.gsub! "-lbz2", ""
    end
    system "make"
    bin.install "pbgzip"
    end
end
