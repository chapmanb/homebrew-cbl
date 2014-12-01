require 'formula'

class IsaacAligner < Formula
  homepage "https://github.com/sequencing/isaac_aligner"
  version "01.14.11.27"
  url "https://github.com/sequencing/isaac_aligner/archive/iSAAC-01.14.11.27.tar.gz"
  sha1 "666a2cc8d5d99c8051a020ae51cfa6ab65ec0f93"

  # incompatible with boost, need to brew unlink boost if installed to compile

  def install
    mkdir "../build"
    cd "../build" do
        system "../isaac_aligner-iSAAC-#{version}/src/configure", "--prefix=#{prefix}"
        system "make"
        system "make install"
    end
  end
end
