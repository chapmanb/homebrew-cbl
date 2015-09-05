require 'formula'

class AgeMetasv < Formula
  homepage "https://github.com/marghoob/AGE/tree/simple-parseable-output"
  version "2015-01-29-3"
  url "https://github.com/marghoob/AGE/archive/344429ccb.tar.gz"
  sha256 "ca9f1072d3cd91858034001b4299a2ea98a7a8930d785bec2aadacbec3dbe523"

  option "without-binary", "Do not use a statically linked binary for 64-bit Linux" if OS.linux?

  resource "age-binary" do
    url "https://s3.amazonaws.com/cloudbiolinux/binaries/age_align-centos5-2015.01.29.3"
    sha256 "a217b8607c972b9ee18d2c603997fe32b8d1d122aec4d32acda4c7bfa8bca0fb"
  end

  def install
    if build.with? "binary"
      resource("age-binary").stage { bin.install "age_align-centos5-2015.01.29.3" => "age_align"}
    else
      system "make"
      bin.install "age_align"
    end
  end

  test do
    system "age_align"
  end
end
