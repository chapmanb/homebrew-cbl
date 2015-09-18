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

  version "0.28.0"
  url "https://github.com/Illumina/manta/releases/download/v#{version}/manta-#{version}.centos5_x86_64.tar.bz2"
  sha256 "aef97bc887cbfca8cfe2e3a076c52bc95b8ecd37f1586b433211cacfcce14ae0"

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
