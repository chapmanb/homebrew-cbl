require 'formula'

class Vt < Formula
  homepage 'https://github.com/atks/vt'
  version '2015-02-10'
  url "https://github.com/atks/vt/archive/a632462.tar.gz"
  sha1 "1fc41946edc05cae5df44f8216c2339ea9d7157f"

  option "with-binary", "Install a statically linked binary for 64-bit Linux" if OS.linux?

  resource "vt-binary" do
    url "https://s3.amazonaws.com/cloudbiolinux/binaries/vt-centos5-2015-02-10"
    sha1 "87b7d1ab1cdf7df5a6807f46da1f7fe38705a773"
  end

  def install
    if build.with? "binary"
      resource("vt-binary").stage { bin.install "vt-centos5-#{version}" => "vt"}
    else
      system 'make'
      bin.install 'vt'
    end
  end

  test do
    system 'vt'
  end
end
