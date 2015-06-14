require 'formula'

class Caveman < Formula
  homepage "https://github.com/cancerit/CaVEMan"
  version "1.6.1"
  url "https://github.com/cancerit/CaVEMan/archive/1.6.1.tar.gz"
  sha1 "712f672d5e17768a42dc21df2e3ac4dc4304d985"

  def install
    inreplace "Makefile", "copyscript test", "copyscript"
    system "make"
    bin.install Dir["bin/*"]
  end

  test do
    system "caveman -h"
  end
end
