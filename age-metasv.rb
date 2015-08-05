require 'formula'

class AgeMetasv < Formula
  homepage "https://github.com/marghoob/AGE/tree/simple-parseable-output"
  version "2015-01-29"
  url "https://github.com/marghoob/AGE/archive/344429ccb.tar.gz"
  sha256 "ca9f1072d3cd91858034001b4299a2ea98a7a8930d785bec2aadacbec3dbe523"

  def install
    system "make"
    bin.install "age_align"
  end

  test do
    system "age_align"
  end
end
