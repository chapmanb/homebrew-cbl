class LinuxRequirement < Requirement
  fatal true
  satisfy OS.linux?
  def message
    "Binaries for manta are only available on Linux."
  end
end

class Manta < Formula
  desc "Structural variant and indel caller for mapped sequencing data"
  homepage "https://github.com/Illumina/manta"

  version "0.29.0"
  url "https://github.com/Illumina/manta/releases/download/v#{version}/manta-#{version}.centos5_x86_64.tar.bz2"
  sha256 "7dd9f2c88f9f918539c32ce1a4d60ad6ae53c0a2c609714330bd411975ec6a2d"

  depends_on LinuxRequirement

  def install
    inreplace "bin/configManta.py" do |s|
      s.gsub! "__file__", "os.path.realpath(__file__)"
    end
    prefix.install Dir["*"]
    rm_rf prefix/"share/demo"
  end

  test do
    system "configManta.py -h"
  end
end
