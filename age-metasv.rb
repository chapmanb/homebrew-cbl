require 'formula'

class AgeMetasv < Formula
  homepage "https://github.com/marghoob/AGE/tree/simple-parseable-output"
  version "2015-01-29-2"
  url "https://github.com/marghoob/AGE/archive/344429ccb.tar.gz"
  sha256 "ca9f1072d3cd91858034001b4299a2ea98a7a8930d785bec2aadacbec3dbe523"

  option "without-binary", "Do not use a statically linked binary for 64-bit Linux" if OS.linux?

  resource "age-binary" do
    url "https://s3.amazonaws.com/cloudbiolinux/binaries/age_align-centos5-2015.01.29.2"
    sha256 "b249a9299f4f36f93b08d03c58226f4d7ebb7630183387accc475550bc8f1bd8"
  end

  def install
    if build.with? "binary"
      resource("age-binary").stage { bin.install "age_align-centos5-2015.01.29.2" => "age_align"}
    else
      system "make"
      bin.install "age_align"
    end
  end

  test do
    system "age_align"
  end
end
