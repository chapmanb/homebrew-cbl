class LinuxRequirement < Requirement
  fatal true
  satisfy OS.linux?
  def message
    "Binaries for manta are only available on Linux."
  end
end

class Manta < Formula
  desc " Structural variant and indel caller for mapped sequencing data"
  desc "Long-read alignment with optimal breakpoint detection"
  homepage "https://github.com/Illumina/manta"

  version "0.27.0"
  url "https://github.com/Illumina/manta/releases/download/v#{version}/manta-#{version}.centos5_x86_64.tar.bz2"
  sha256 "40c06e42676b3c37c568dfc342efbea17f625f17d2ae8ab2f0a2e6e2bb6b709a"

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
