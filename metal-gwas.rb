require 'formula'

class MetalGwas < Formula
  homepage "http://csg.sph.umich.edu/abecasis/Metal/index.html"
  version "2011-03-25"
  url "http://csg.sph.umich.edu/abecasis/Metal/download/generic-metal-2011-03-25.tar.gz"
  sha1 "5b1e497f6d531145d5207d4fd945ea6bf3402af9"

  def install
    system "make", "install", "INSTALLDIR=#{prefix}"
    bin.install_symlink "#{prefix}/metal" => "metal"
  end

  test do
    system "metal"
  end
end
