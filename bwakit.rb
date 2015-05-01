require 'formula'

class Bwakit < Formula
  homepage "https://github.com/lh3/bwa/tree/master/bwakit"
  version "0.7.12"
  url "http://downloads.sourceforge.net/project/bio-bwa/bwakit/bwakit-0.7.12_x64-linux.tar.bz2"
  sha1 "0f7d60daf63fc5519ef3f79027502e7744861b3a"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix / "run-bwamem" => "run-bwamem"
  end

  test do
    system "run-bwamem -h"
  end
end
