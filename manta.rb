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

  version "0.26.5"
  url "https://github.com/Illumina/manta/releases/download/v#{version}/manta-#{version}.centos5_x86_64.tar.bz2"
  sha256 "ef58cc6955355c5b63b3a6181d9db3448d0399f19aab764980fa8ecd0351958d"

  depends_on LinuxRequirement

  def install
    inreplace "bin/configManta.py" do |s|
      s.gsub! "__file__", "os.path.realpath(__file__)"
    end
    prefix.install Dir["*"]
  end

  test do
    system "configManta.py -h"
  end
end
