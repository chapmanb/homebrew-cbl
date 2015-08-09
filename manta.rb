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

  version "0.27.1"
  url "https://github.com/Illumina/manta/releases/download/v#{version}/manta-#{version}.centos5_x86_64.tar.bz2"
  sha256 "788a0a184168ed91bd3cf0c44dda6b9186fd9562476203b8e92b20e963f48769"

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
